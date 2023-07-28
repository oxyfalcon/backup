import 'package:app/Provider/api_provider.dart';
import 'package:app/Provider/local_provider.dart';
import 'package:app/schema/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  Future openDialogCharacter(BuildContext context) {
    TextEditingController input = TextEditingController();
    final api = ref.read(apiProvider.notifier);
    CharacterItems items = ref.watch(characterProvider);
    return showAdaptiveDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () {
                    items.name = input.text;
                    api.characterFilter();
                    Navigator.of(context).pop();
                    items.gender = CharacterGender.empty;
                    items.species = CharacterSpecies.empty;
                    items.status = CharacterStatus.empty;
                    input.text = "";
                    ref.watch(valueProvider.notifier).index = 1;
                  },
                  child: const Text("Save"),
                )
              ],
              title: const Text("Search"),
              leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                    items.gender = CharacterGender.empty;
                    items.species = CharacterSpecies.empty;
                    items.status = CharacterStatus.empty;
                    input.text = "";
                  }),
              centerTitle: false,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder()),
                    controller: input,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(8.0), child: GenderButton()),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: StatusButton(),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SpeciesButton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openDialogLocation(BuildContext context) {
    TextEditingController locationName = TextEditingController();
    TextEditingController dimensionName = TextEditingController();
    final api = ref.read(apiProvider.notifier);
    LocationItems items = ref.watch(locationProvider);
    return showAdaptiveDialog(
        context: context,
        builder: (context) => Dialog.fullscreen(
              child: SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: false,
                    title: const Text("Search"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            items.name = locationName.text;
                            items.dimension = dimensionName.text;
                            api.locationFilter();
                            Navigator.of(context).pop();
                            locationName.text = "";
                            dimensionName.text = "";
                          },
                          child: const Text("Save"))
                    ],
                    leading: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                          locationName.text = "";
                          dimensionName.text = "";
                        }),
                  ),
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: "Location Name",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder()),
                          controller: locationName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: "Dimension Name",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder()),
                          controller: dimensionName,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Future openDialogEpisodes(BuildContext context) {
    TextEditingController episodeName = TextEditingController();
    return showAdaptiveDialog(
        context: context,
        builder: (context) => Dialog.fullscreen(
              child: SafeArea(
                  child: Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: const Text("Search"),
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close)),
                ),
                body: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: episodeName,
                      decoration: const InputDecoration(
                          hintText: "Episode Name",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SeasonSelectionButton(),
                  const EpisodeListTiles()
                ]),
              )),
            ));
  }

  @override
  Widget build(BuildContext context) {
    int val = ref.watch(valueProvider);

    return IconButton(
        onPressed: () {
          switch (val) {
            case 0:
              openDialogCharacter(context);

            case 1:
              openDialogLocation(context);

            case 2:
              openDialogEpisodes(context);

            default:
              throw ("Error in SearchWIdget");
          }
        },
        icon: const Icon(Icons.search));
  }
}

class SeasonSelectionButton extends ConsumerStatefulWidget {
  const SeasonSelectionButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeasonSelectionButtonState();
}

class _SeasonSelectionButtonState extends ConsumerState<SeasonSelectionButton> {
  SeasonNumber number = SeasonNumber.empty;

  @override
  Widget build(BuildContext context) {
    var seasonNumber = ref.watch(seasonProvider);

    return SegmentedButton<SeasonNumber>(
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      segments: const <ButtonSegment<SeasonNumber>>[
        ButtonSegment(value: SeasonNumber.S01, label: Text("S01")),
        ButtonSegment(value: SeasonNumber.S02, label: Text("S02")),
        ButtonSegment(value: SeasonNumber.S03, label: Text("S03")),
        ButtonSegment(value: SeasonNumber.S04, label: Text("S04")),
        ButtonSegment(value: SeasonNumber.S05, label: Text("S05")),
      ],
      selected: <SeasonNumber>{seasonNumber},
      onSelectionChanged: (Set<SeasonNumber> selected) {
        SeasonNumber temp;
        (selected.isNotEmpty)
            ? temp = selected.first
            : temp = SeasonNumber.empty;
        ref.watch(seasonProvider.notifier).changeSeasonNumber(temp);
        ref.watch(episodeProvider.notifier).changeEpisodeList(temp);
      },
    );
  }
}

class EpisodeListTiles extends ConsumerStatefulWidget {
  const EpisodeListTiles({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EpisodeListTilesState();
}

class _EpisodeListTilesState extends ConsumerState<EpisodeListTiles> {
  @override
  Widget build(BuildContext context) {
    List<EpisodeNumber> list = ref.watch(episodeProvider);
    return Expanded(
      child: ListView(
        children: [
          for (var i in list)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(i.name),
              ),
            ),
        ],
      ),
    );
  }
}

class StatusButton extends ConsumerStatefulWidget {
  const StatusButton({super.key});

  @override
  ConsumerState<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends ConsumerState<StatusButton> {
  @override
  Widget build(BuildContext context) {
    CharacterItems items = ref.watch(characterProvider);
    return SegmentedButton<CharacterStatus>(
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      segments: const <ButtonSegment<CharacterStatus>>[
        ButtonSegment(value: CharacterStatus.alive, label: Text("Alive")),
        ButtonSegment(value: CharacterStatus.dead, label: Text("Dead")),
        ButtonSegment(value: CharacterStatus.unknown, label: Text("Unknown")),
      ],
      selected: <CharacterStatus>{items.status},
      onSelectionChanged: (Set<CharacterStatus> selected) {
        setState(() {
          (selected.isNotEmpty)
              ? items.status = selected.first
              : items.status = CharacterStatus.empty;
        });
      },
    );
  }
}

class GenderButton extends ConsumerStatefulWidget {
  const GenderButton({super.key});

  @override
  ConsumerState<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends ConsumerState<GenderButton> {
  @override
  Widget build(BuildContext context) {
    CharacterItems items = ref.watch(characterProvider);
    return SegmentedButton<CharacterGender>(
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      segments: const <ButtonSegment<CharacterGender>>[
        ButtonSegment(
            value: CharacterGender.male,
            label: Text("Male"),
            icon: Icon(Icons.male)),
        ButtonSegment(
            value: CharacterGender.female,
            label: Text("Female"),
            icon: Icon(Icons.female)),
        ButtonSegment(
            value: CharacterGender.unknown,
            label: Text("Unknown"),
            icon: Icon(Icons.error)),
      ],
      selected: <CharacterGender>{items.gender},
      onSelectionChanged: (Set<CharacterGender> select) {
        setState(() {
          (select.isNotEmpty)
              ? items.gender = select.first
              : items.gender = CharacterGender.empty;
        });
      },
    );
  }
}

class SpeciesButton extends ConsumerStatefulWidget {
  const SpeciesButton({super.key});

  @override
  ConsumerState<SpeciesButton> createState() => _SpeciesButtonState();
}

class _SpeciesButtonState extends ConsumerState<SpeciesButton> {
  @override
  Widget build(BuildContext context) {
    CharacterItems items = ref.watch(characterProvider);
    return SegmentedButton<CharacterSpecies>(
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      segments: const <ButtonSegment<CharacterSpecies>>[
        ButtonSegment(value: CharacterSpecies.alien, label: Text("Alien")),
        ButtonSegment(value: CharacterSpecies.human, label: Text("Human")),
      ],
      selected: <CharacterSpecies>{items.species},
      onSelectionChanged: (Set<CharacterSpecies> selected) {
        setState(() {
          (selected.isNotEmpty)
              ? items.species = selected.first
              : items.species = CharacterSpecies.empty;
        });
      },
    );
  }
}
