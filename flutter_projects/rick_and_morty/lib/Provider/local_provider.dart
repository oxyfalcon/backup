import 'package:app/schema/enum.dart';
import 'package:app/screen/character/character_display_list.dart';
import 'package:app/screen/character/character_search.dart';
import 'package:app/screen/episode/episode_display_list.dart';
import 'package:app/screen/episode/episode_search.dart';
import 'package:app/screen/location/location_display_list.dart';
import 'package:app/screen/location/location_search.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValueNotifier extends StateNotifier<int> {
  ValueNotifier() : super(0);
  int index = 1;
  void change(int value) {
    index = 1;
    state = value;
  }
}

final valueProvider =
    StateNotifierProvider<ValueNotifier, int>((ref) => ValueNotifier());

final characterProvider =
    StateProvider<CharacterItems>((ref) => CharacterItems.empty());

final locationProvider =
    StateProvider<LocationItems>((ref) => LocationItems.empty());

class EpisodeNotifier extends Notifier<List<EpisodeNumber>> {
  @override
  List<EpisodeNumber> build() => [];
  void changeEpisodeList(SeasonNumber season) => state = seasonEpisode[season]!;
}

final episodeProvider = NotifierProvider<EpisodeNotifier, List<EpisodeNumber>>(
    () => EpisodeNotifier());

class SeasonNotifier extends StateNotifier<SeasonNumber> {
  SeasonNotifier() : super(SeasonNumber.empty);

  void changeSeasonNumber(SeasonNumber s) => state = s;
}

final seasonProvider = StateNotifierProvider<SeasonNotifier, SeasonNumber>(
    (ref) => SeasonNotifier());

class SelectedEpisodeNotifier
    extends AutoDisposeNotifier<Map<SeasonNumber, List<EpisodeNumber>>> {
  @override
  Map<SeasonNumber, List<EpisodeNumber>> build() => selectedEpisode;

  void addEpisode(EpisodeNumber e) {
    SeasonNumber s = ref.watch(seasonProvider);
    state[s]!.add(e);
  }

  void removeEpisode(EpisodeNumber e) {
    SeasonNumber s = ref.watch(seasonProvider);
    state[s]!.remove(e);
  }

  void removeAll() {
    state.updateAll((key, value) => List<EpisodeNumber>.empty(growable: true));
    Map<SeasonNumber, List<EpisodeNumber>> newMap =
        Map<SeasonNumber, List<EpisodeNumber>>.from(state);
    state = newMap;
  }
}

class SelectingDisplayNotifier extends Notifier<Widget> {
  @override
  Widget build() {
    var val = ref.watch(valueProvider);
    switch (val) {
      case 0:
        return DisplayCharacter();
      case 1:
        return DisplayLocation();
      case 2:
        return DisplayEpisode();

      default:
        throw ('Error in selectionPageNotifier');
    }
  }
}

class SelectingSearchNotifier extends AutoDisposeNotifier<Widget> {
  @override
  Widget build() {
    var val = ref.watch(valueProvider);
    switch (val) {
      case 0:
        return const SearchCharacter();

      case 1:
        return const SearchLocation();

      case 2:
        return const SearchEpisode();
      default:
        throw ('Error in SelectingSearchNotifier');
    }
  }
}

final selectingSearchProvider =
    AutoDisposeNotifierProvider<SelectingSearchNotifier, Widget>(
        () => SelectingSearchNotifier());

final selectedEpisodeProvider = AutoDisposeNotifierProvider<
    SelectedEpisodeNotifier,
    Map<SeasonNumber, List<EpisodeNumber>>>(() => SelectedEpisodeNotifier());

final selectingDisplayProvider =
    NotifierProvider<SelectingDisplayNotifier, Widget>(
        () => SelectingDisplayNotifier());
