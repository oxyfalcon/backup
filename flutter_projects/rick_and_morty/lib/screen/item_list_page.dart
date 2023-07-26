import 'package:app/Provider/api_provider.dart';
import 'package:app/screen/character_display_page.dart';
import 'package:app/screen/character_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/Provider/local_provider.dart';

class ItemList extends ConsumerWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topRight,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeButton(),
              Search(),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: MoreDisplayMenu(),
              ),
            ],
          ),
        ),
        const Expanded(child: DisplayList()),
      ],
    );
  }
}

class MoreDisplayMenu extends ConsumerStatefulWidget {
  const MoreDisplayMenu({super.key});

  @override
  ConsumerState<MoreDisplayMenu> createState() => _MoreDisplayMenuState();
}

class _MoreDisplayMenuState extends ConsumerState<MoreDisplayMenu> {
  int? selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    ref.watch(apiProvider);
    List<int> list = List.generate(
        ref.read(apiProvider.notifier).length, (index) => index + 1);

    return DropdownButton<int>(
      alignment: AlignmentDirectional.centerEnd,
      icon: const Icon(Icons.arrow_downward),
      items: list
          .map((int value) => DropdownMenuItem<int>(
                value: value,
                child: Text(
                  "$value",
                  textAlign: TextAlign.right,
                ),
              ))
          .toList(),
      onChanged: (int? value) {
        ref.watch(apiProvider.notifier).getPage(value);
        selectedValue = value;
        ref.watch(valueProvider.notifier).index = value;
      },
      value: ref.watch(valueProvider.notifier).index,
    );
  }
}

class DisplayList extends ConsumerWidget {
  const DisplayList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.read(valueProvider);
    final getList = ref.watch(apiProvider);
    return getList.when(
        data: (list) {
          if (list.isNotEmpty) {
            return ListView(
              children: [
                for (var itr in list)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: ListTile(
                        onTap: () {
                          switch (value) {
                            case 0:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CharacterDisplayPage(itr: itr)));
                              break;
                          }
                        },
                        title: Text(itr.name),
                        subtitle:
                            Text(DateFormat.yMMMMEEEEd().format(itr.created)),
                        leading: (value == 0) ? Image.network(itr.image) : null,
                      ),
                    ),
                  ),
              ],
            );
          } else {
            return Center(
              child: FittedBox(
                  child: Text("No results",
                      style: Theme.of(context).textTheme.labelLarge)),
            );
          }
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator()));
  }
}

class HomeButton extends ConsumerWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          ref.watch(apiProvider.notifier).homePage();
        },
        icon: const Icon(Icons.home));
  }
}
