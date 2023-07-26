enum CharacterSpecies { human, alien, empty }

enum CharacterStatus { alive, unknown, dead, empty }

enum CharacterGender { male, female, unknown, empty }

class CharacterItems {
  String name;
  CharacterSpecies species;
  CharacterGender gender;
  CharacterStatus status;

  CharacterItems(
      {required this.name,
      required this.species,
      required this.gender,
      required this.status});
  CharacterItems.empty()
      : this(
            gender: CharacterGender.empty,
            name: "",
            species: CharacterSpecies.empty,
            status: CharacterStatus.empty);
}

final characterSpeciesValues = <CharacterSpecies, String>{
  CharacterSpecies.alien: "Alien",
  CharacterSpecies.human: "Human",
  CharacterSpecies.empty: "",
};

final characterStatusValues = <CharacterStatus, String>{
  CharacterStatus.alive: "Alive",
  CharacterStatus.dead: "Dead",
  CharacterStatus.unknown: "unknown",
  CharacterStatus.empty: "",
};

final characterGenderValues = <CharacterGender, String>{
  CharacterGender.female: "Female",
  CharacterGender.male: "Male",
  CharacterGender.unknown: "unknown",
  CharacterGender.empty: "",
};

class LocationItems {
  String name;
  String dimension;

  LocationItems({required this.name, required this.dimension});
  LocationItems.empty() : this(name: "", dimension: "");
}
