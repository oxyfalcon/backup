import 'package:app/schema/enum.dart';
import 'package:app/schema/episode_schema.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocation origin;
  final CharacterLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  List<Episode> allEpisodePresentInCharacter = <Episode>[];
  Map<SeasonNumber, List<EpisodeNumber>> mapOfSeasonEpisode = {};

  void episodeMapping() async {
    List<Future<http.Response>> responseList = [];
    for (var i in episode) {
      responseList.add(http.get(Uri.parse(i)));
    }
    var x1 = await Future.wait(responseList.where((element) => true));
    for (var i in x1) {
      allEpisodePresentInCharacter.add(await jsonDecode(i.body)['results']);
    }
  }

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: CharacterLocation.fromJson(json["origin"]),
        location: CharacterLocation.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );
}

class CharacterLocation {
  CharacterLocation({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      CharacterLocation(
        name: json["name"],
        url: json["url"],
      );
}
