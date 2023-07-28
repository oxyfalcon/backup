import 'package:app/schema/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValueNotifier extends StateNotifier<int> {
  ValueNotifier() : super(0);
  int? index = 1;
  void change(int value) {
    index = 1;
    state = value;
  }

  String str() {
    switch (state) {
      case 0:
        return '/character';
      case 1:
        return '/location';
      case 2:
        return '/episode';

      default:
        throw ("Error in str()");
    }
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
