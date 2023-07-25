import 'package:app/schema/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSearch extends StatefulWidget {
  const CharacterSearch({super.key});

  @override
  State<CharacterSearch> createState() => _CharacterSearchState();
}

class _CharacterSearchState extends State<CharacterSearch> {
  TextEditingController input = TextEditingController();
  Future openDialog(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Search"),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: Navigator.of(context).pop,
              ),
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

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => openDialog(context), icon: const Icon(Icons.search));
  }
}

class StatusButton extends ConsumerStatefulWidget {
  const StatusButton({super.key});

  @override
  ConsumerState<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends ConsumerState<StatusButton> {
  CharacterStatus statusValue = CharacterStatus.empty;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<CharacterStatus>(
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      segments: const <ButtonSegment<CharacterStatus>>[
        ButtonSegment(value: CharacterStatus.alive, label: Text("Alive")),
        ButtonSegment(value: CharacterStatus.dead, label: Text("Dead")),
        ButtonSegment(value: CharacterStatus.unknown, label: Text("Unknown")),
      ],
      selected: <CharacterStatus>{statusValue},
      onSelectionChanged: (Set<CharacterStatus> selected) {
        setState(() {
          if (selected.isNotEmpty) {
            statusValue = selected.first;
          } else {
            statusValue = CharacterStatus.empty;
          }
        });
      },
    );
  }
}

class GenderButton extends StatefulWidget {
  const GenderButton({super.key});

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  CharacterGender genderValue = CharacterGender.empty;
  @override
  Widget build(BuildContext context) {
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
      selected: <CharacterGender>{genderValue},
      onSelectionChanged: (Set<CharacterGender> select) {
        setState(() {
          if (select.isNotEmpty) {
            genderValue = select.first;
          } else {
            genderValue = CharacterGender.empty;
          }
        });
      },
    );
  }
}

class SpeciesButton extends StatefulWidget {
  const SpeciesButton({super.key});

  @override
  State<SpeciesButton> createState() => _SpeciesButtonState();
}

class _SpeciesButtonState extends State<SpeciesButton> {
  CharacterSpecies speciesValue = CharacterSpecies.empty;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<CharacterSpecies>(
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      segments: const <ButtonSegment<CharacterSpecies>>[
        ButtonSegment(value: CharacterSpecies.alien, label: Text("Alien")),
        ButtonSegment(value: CharacterSpecies.human, label: Text("Human")),
      ],
      selected: <CharacterSpecies>{speciesValue},
      onSelectionChanged: (Set<CharacterSpecies> selected) {
        setState(() {
          if (selected.isNotEmpty) {
            speciesValue = selected.first;
          } else {
            speciesValue = CharacterSpecies.empty;
          }
        });
      },
    );
  }
}

class SubmitButton extends ConsumerWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
