import 'package:app/api_provider.dart';
import 'package:app/character_display_page.dart';
import 'package:app/character_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/local_provider.dart';

class ItemList extends ConsumerWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(valueProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topRight,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              CharacterSearch(),
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
    final state = ref.watch(apiProvider.notifier);
    final value = state.pagelistGenerator();

    return FutureBuilder(
        builder: (context, AsyncSnapshot<List<int>> snapshot) {
          List<DropdownMenuItem<int>> children;
          if (snapshot.hasData) {
            children = snapshot.data!
                .map((int value) => DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        "$value",
                        textAlign: TextAlign.right,
                      ),
                    ))
                .toList();
          } else {
            children = [];
          }
          return DropdownButton(
              items: children,
              onChanged: (int? value) {
                state.getPage(value);
                ref.watch(valueProvider.notifier).index = value;
                selectedValue = value;
              },
              value: ref.watch(valueProvider.notifier).index);
        },
        future: value);
  }
}

class DisplayList extends ConsumerWidget {
  const DisplayList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.read(valueProvider);
    final getList = ref.watch(apiProvider);
    return getList.when(
        data: (list) => ListView(
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
            ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator()));
  }
}
