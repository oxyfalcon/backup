import 'package:app/schema/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValueNotifier extends StateNotifier<int> {
  ValueNotifier() : super(0);
  int? index = 1;
  void change(int value) {
    index = 1;
    state = value;
  }
}

final valueProvider =
    StateNotifierProvider<ValueNotifier, int>((ref) => ValueNotifier());

class CharacterSearchNotifier extends Notifier<CharacterItems> {
  String str = "";

  @override
  CharacterItems build() {
    return const CharacterItems(
        name: "",
        species: CharacterSpecies.empty,
        gender: CharacterGender.empty,
        status: CharacterStatus.empty);
  }
}

final characterProvider =
    NotifierProvider.autoDispose<CharacterSearchNotifier, CharacterItems>(
        () => CharacterSearchNotifier());
