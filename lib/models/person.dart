import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int id; //: 20,
  final String name; //": "Ants in my Eyes Johnson",
  final String status; //": "unknown",
  final String species; //": "Human",
  final String type; //": "Human with ants in his eyes",
  final String gender; //": "Male",
  final Map<String, String> origin; //": {name: unknown, url: },
  final Map<String, String>
  location; //": {name: Interdimensional Cable, url: https://rickandmortyapi.com/api/location/6},
  final String
  image; //": "https://rickandmortyapi.com/api/character/avatar/20.jpeg",
  final List<String> episode; //": [https://rickandmortyapi.com/api/episode/8]
  final String url; //": "https://rickandmortyapi.com/api/character/20",
  final String created; //": "2017-11-04T22:34:53.659Z"

  Person({
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

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          // runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status &&
          species == other.species &&
          type == other.type &&
          gender == other.gender &&
          // origin == other.origin &&
          // location == other.location &&
          image == other.image &&
          // episode == other.episode &&
          url == other.url &&
          created == other.created;

  @override
  int get hashCode => Object.hash(
    id,
    name,
    status,
    species,
    type,
    gender,
    origin,
    location,
    image,
    episode,
    url,
    created,
  );
}
