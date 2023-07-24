import 'dart:convert';
import 'package:app/schema/character_schema.dart';
import 'package:app/schema/location_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:app/schema/episode_schema.dart';

class ValueNotifier extends StateNotifier<int> {
  ValueNotifier() : super(0);

  void change(int value) {
    state = value;
  }
}

final valueProvider =
    StateNotifierProvider<ValueNotifier, int>((ref) => ValueNotifier());

class Api extends AutoDisposeAsyncNotifier<List<dynamic>> {
  static const String _baseUrl = "https://rickandmortyapi.com/api/";
  String str = "";
  int pageNumber = 0;
  @override
  Future<List<dynamic>> build() {
    final val = ref.watch(valueProvider);
    switch (val) {
      case 0:
        str = "$_baseUrl/character";
        return getCharacterResponse(http.get(Uri.parse(str)));
      case 1:
        str = "$_baseUrl/location";
        return getLocationResponse(http.get(Uri.parse(str)));
      case 2:
        str = "$_baseUrl/episode";

        return getEpisodeResponse(http.get(Uri.parse(str)));
      default:
        throw ("Error In GetProvider");
    }
  }

  Future<List<Character>> getCharacterResponse(Future<http.Response> r) async {
    final response = await r;
    var json = jsonDecode(response.body)['results'];
    pageNumber = jsonDecode(response.body)['info']['pages'];
    List<Character> characterList = [];
    for (var itr in json) {
      characterList.add(Character.fromJson(itr));
    }
    return characterList;
  }

  Future<List<Location>> getLocationResponse(Future<http.Response> r) async {
    final response = await r;
    var json = jsonDecode(response.body)['results'];
    pageNumber = jsonDecode(response.body)['info']['pages'];
    List<Location> locationList = [];
    for (var itr in json) {
      locationList.add(Location.fromJson(itr));
    }
    return locationList;
  }

  Future<List<Episode>> getEpisodeResponse(Future<http.Response> r) async {
    final response = await r;
    var json = jsonDecode(response.body)['results'];
    pageNumber = jsonDecode(response.body)['info']['pages'];
    List<Episode> episodeList = [];
    for (var itr in json) {
      episodeList.add(Episode.fromJson(itr));
    }
    return episodeList;
  }

  void getPage(int? index) async {
    final val = ref.read(valueProvider);
    switch (val) {
      case 0:
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() => getCharacterResponse(
            http.get(Uri.parse("$_baseUrl/character?page=$index"))));
      case 1:
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() => getLocationResponse(
            http.get(Uri.parse("$_baseUrl/location?page=$index"))));
      case 2:
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() => getEpisodeResponse(
            http.get(Uri.parse("$_baseUrl/episode?page=$index"))));
      default:
        throw ("Error In GetProvider");
    }
  }
}

final apiProvider = AsyncNotifierProvider.autoDispose<Api, List>(() {
  return Api();
});
