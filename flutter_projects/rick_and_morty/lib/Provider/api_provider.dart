import 'dart:async';
import 'dart:convert';
import 'package:app/Provider/local_provider.dart';
import 'package:app/Provider/pagination_state.dart';
import 'package:app/schema/character_schema.dart';
import 'package:app/schema/enum.dart';
import 'package:app/schema/location_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:app/schema/episode_schema.dart';

class Api extends AutoDisposeNotifier<PaginationState> {
  final String _baseUrl = "https://rickandmortyapi.com/api";
  String str = "";
  String filter = "";
  String page = "page=";
  int length = 0;
  Timer _timer = Timer(const Duration(milliseconds: 0), () {});
  List<dynamic> _items = [];
  bool finished = false;

  @override
  PaginationState build() {
    finished = false;
    name();
    return PaginationState.loading();
  }

  void name() async {
    str = ref.read(valueProvider.notifier).str();
    _items = await getResponseList("$_baseUrl$str");
    state = PaginationState.data(_items);
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
    finished = false;
    ref.watch(valueProvider.notifier).index = 1;
    state = const PaginationState.loading();
    _items = await getResponseList("$_baseUrl$str?$r");
    state = PaginationState.data(_items);
  }

  Future<void> getNextPage() async {
    if (_timer.isActive && _items.isNotEmpty) {
      return;
    }
    _timer = Timer(const Duration(milliseconds: 1000), () {});
    state = PaginationState.onGoingLoading(_items);
    int pageNumber = ref.watch(valueProvider.notifier).index;
    if (pageNumber <= length) {
      if (pageNumber == length) {
        finished = true;
        return;
      }
      pageNumber++;
      final nextItems =
          await getResponseList("$_baseUrl$str?$page$pageNumber&$filter");
      ref.watch(valueProvider.notifier).index = pageNumber;
      state = PaginationState.data(_items..addAll(nextItems));
    }
  }
}

final apiProvider =
    NotifierProvider.autoDispose<Api, PaginationState>(() => Api());
