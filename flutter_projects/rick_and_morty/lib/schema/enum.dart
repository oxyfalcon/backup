enum CharacterSpecies { human, alien, empty }

enum CharacterStatus { alive, unknown, dead, empty }

enum CharacterGender { male, female, unknown, empty }

class CharacterItems {
  final String name;
  final CharacterSpecies species;
  final CharacterGender gender;
  final CharacterStatus status;

  const CharacterItems(
      {required this.name,
      required this.species,
      required this.gender,
      required this.status});
}

final characterSpeciesValues = {
  CharacterSpecies.alien: "Alien",
  CharacterSpecies.human: "Human",
  CharacterSpecies.empty: "",
};

final characterStatusValues = {
  CharacterStatus.alive: "Alive",
  CharacterStatus.dead: "Dead",
  CharacterStatus.empty: "",
};

final characterGenderValues = {
  CharacterGender.female: "Female",
  CharacterGender.male: "Male",
  CharacterGender.unknown: "unknown",
  CharacterGender.empty: "",
};
