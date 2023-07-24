import 'package:app/api_provider.dart';
import 'package:app/item_display_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemList extends ConsumerStatefulWidget {
  const ItemList({super.key});

  @override
  ConsumerState<ItemList> createState() => _ItemListState();
}

class _ItemListState extends ConsumerState<ItemList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MoreDisplayMenu(),
        Expanded(child: DisplayList()),
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
  int? _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    print("build");
    final page = ref.watch(apiProvider.notifier).pageNumber;
    final changePage = ref.watch(apiProvider.notifier);
    List<int> list = List.generate(page, (index) => index + 1);
    print("List Length: ${list.length}");

    return DropdownButton<int>(
      icon: const Icon(Icons.arrow_downward),
      items: list
          .map((int value) => DropdownMenuItem<int>(
                value: value,
                child: Text(
                  "$value",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      onChanged: (int? value) {
        changePage.getPage(value);
        _selectedValue = value;
      },
      value: _selectedValue,
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
        data: (list) => ListView(children: [
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
            ]),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator()));
  }
}
