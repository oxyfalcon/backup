import 'dart:async';
import 'dart:convert';
import 'package:app/Provider/local_provider.dart';
import 'package:app/schema/character_schema.dart';
import 'package:app/schema/enum.dart';
import 'package:app/schema/location_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:app/schema/episode_schema.dart';

class Api extends AutoDisposeAsyncNotifier<List<dynamic>> {
  final String _baseUrl = "https://rickandmortyapi.com/api";
  String str = "";
  String filter = "";
  String page = "page=";
  int length = 0;
  Timer _timer = Timer(const Duration(milliseconds: 0), () {});

  @override
  Future<List<dynamic>> build() {
    str = ref.read(valueProvider.notifier).str();
    return getResponseList("$_baseUrl$str");
  }

  Future<List<dynamic>> getResponseList(String r) async {
    final response = await http.get(Uri.parse(r));
    final val = ref.watch(valueProvider);
    var json = jsonDecode(response.body)['results'];
    List<dynamic> list = [];
    if (jsonDecode(response.body)['info'] == null) {
      length = 0;
      return list;
    } else {
      length = jsonDecode(response.body)['info']['pages'];
    }

    switch (val) {
      case 0:
        for (var itr in json) {
          list.add(Character.fromJson(itr));
        }
      case 1:
        for (var itr in json) {
          list.add(Location.fromJson(itr));
        }
      case 2:
        for (var itr in json) {
          list.add(Episode.fromJson(itr));
        }
      default:
        throw ("Error in getResponse");
    }
    return list;
  }

  void characterFilter() {
    CharacterItems characterSearchItems = ref.watch(characterProvider);
    String characterName = characterSearchItems.name;
    String characterGender =
        characterGenderValues[characterSearchItems.gender]!;
    String characterStatus =
        characterStatusValues[characterSearchItems.status]!;
    String characterSpecies =
        characterSpeciesValues[characterSearchItems.species]!;

    filter =
        "name=$characterName&status=$characterStatus&species=$characterSpecies&gender=$characterGender";
    getSearchItems(filter);
  }

  void locationFilter() {
    LocationItems locationSearchItems = ref.watch(locationProvider);
    String locationName = locationSearchItems.name;
    String locationDimension = locationSearchItems.dimension;

    filter = "name=$locationName&dimension=$locationDimension";
    getSearchItems(filter);
  }

  void getSearchItems(String r) async {
    ref.watch(valueProvider.notifier).index = 1;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => getResponseList("$_baseUrl$str?$r"));
  }

  Future<void> getNextPage() async {
    if (_timer.isActive) {
      return;
    }
    _timer = Timer(const Duration(milliseconds: 1000), () {});
    int pageNumber = ref.watch(valueProvider.notifier).index;
    if (pageNumber <= length) {
      pageNumber++;
      print(
          "index = $pageNumber, length: $length, \n url: $_baseUrl$str?$page$pageNumber&$filter");
      final nextItems =
          await getResponseList("$_baseUrl$str?$page$pageNumber&$filter");
      state = AsyncValue.data(state.value!..addAll(nextItems));
      ref.watch(valueProvider.notifier).index = pageNumber;
    }
  }
}

final apiProvider = AsyncNotifierProvider.autoDispose<Api, List>(() => Api());
