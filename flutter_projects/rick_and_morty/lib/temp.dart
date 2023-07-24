import 'dart:convert';
import 'package:app/schema/character_schema.dart';
import 'package:app/schema/location_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:app/schema/episode_schema.dart';

String baseUrl = "https://rickandmortyapi.com/api/";

final characterProvider = FutureProvider<List<Character>>((ref) async {
  final response = await http.get(Uri.parse("$baseUrl/character"));
  var json = jsonDecode(response.body)['results'];
  List<Character> characterList = [];
  for (var itr in json) {
    characterList.add(Character.fromJson(itr));
  }
  return characterList;
});

final locationProvider = FutureProvider<List<Location>>((ref) async {
  var url = Uri.parse("$baseUrl/location");
  final response = await http.get(url);
  var json = jsonDecode(response.body)['results'];
  List<Location> locationList = [];
  for (var itr in json) {
    locationList.add(Location.fromJson(itr));
  }
  return locationList;
});

final episodeProvider = FutureProvider<List<Episode>>((ref) async {
  var url = Uri.parse("$baseUrl/episode");
  final response = await http.get(url);
  var json = jsonDecode(response.body)['results'];
  List<Episode> episodeList = [];
  for (var itr in json) {
    episodeList.add(Episode.fromJson(itr));
  }
  return episodeList;
});

class ValueNotifier extends StateNotifier<int> {
  ValueNotifier() : super(0);

  void change(int value) {
    state = value;
  }
}

final valueProvider =
    StateNotifierProvider<ValueNotifier, int>((ref) => ValueNotifier());

class ApiNotifier extends AsyncNotifier<List> {
  @override
  List build() {
    final val = ref.watch(valueProvider);
    final locationList = ref.watch(locationProvider);
    final episodeList = ref.read(episodeProvider);
    final characterList = ref.read(characterProvider);

    switch (val) {
      case 0:
        return characterList.when(
            data: (data) => data,
            error: (error, stacktrace) => [],
            loading: () => []);

      case 1:
        return locationList.whenData((value) => value).value!;

      case 2:
        return episodeList.whenData((value) => value).value!;

      default:
        throw ("Error in API_NOTIFIER");
    }
  }
}

final apiProvider =
    AsyncNotifierProvider<ApiNotifier, List>(() => ApiNotifier());
