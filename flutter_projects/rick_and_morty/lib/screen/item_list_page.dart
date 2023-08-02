import 'package:app/Provider/api_provider.dart';
import 'package:app/screen/character_display_page.dart';
import 'package:app/screen/search.dart';
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
              Search(),
            ],
          ),
        ),
        Expanded(child: DisplayList()),
      ],
    );
  }
}

class DisplayList extends ConsumerWidget {
  DisplayList({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      final delta = MediaQuery.of(context).size.width * 0.20;
      if (maxScroll - currentScroll <= delta) {
        ref.watch(apiProvider.notifier).getNextPage();
      }
    });
    final getList = ref.watch(apiProvider);
    final value = ref.watch(valueProvider);

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        getList.when(
            onGoingError: (items, e, stk) =>
                CurrentWidget(value: value, list: items),
            onGoingLoading: (items) => CurrentWidget(value: value, list: items),
            data: (list) {
              if (list.isEmpty) {
                return SliverToBoxAdapter(
                    child: Center(
                  child: Text("No results",
                      style: Theme.of(context).textTheme.labelLarge),
                ));
              } else {
                return CurrentWidget(
                  value: value,
                  list: list,
                );
              }
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                )),
        OnGoingWidget()
      ],
    );
  }
}

class CurrentWidget extends StatelessWidget {
  const CurrentWidget({super.key, required this.value, required this.list});

  final int value;
  final List<dynamic> list;
  @override
  Widget build(BuildContext context) {
    print("CurrentBuild");
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: list.length,
            (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: ListTile(
                    onTap: () {
                      switch (value) {
                        case 0:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDisplayPage(itr: list[index])));
                          break;
                      }
                    },
                    title: Text(list[index].name),
                    subtitle: Text(
                        DateFormat.yMMMMEEEEd().format(list[index].created)),
                    leading:
                        (value == 0) ? Image.network(list[index].image) : null,
                  )),
                )));
  }
}

class OnGoingWidget extends ConsumerWidget {
  const OnGoingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.read(apiProvider);
    return SliverToBoxAdapter(
      child: list.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        onGoingLoading: (items) {
          if (!ref.read(apiProvider.notifier).finished) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text("All Done"),
            );
          }
        },
        onGoingError: (items, e, stk) => Center(child: Text(e.toString())),
      ),
    );
  }
}
