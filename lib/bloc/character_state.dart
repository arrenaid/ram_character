part of 'character_bloc.dart';

class CharacterState extends Equatable {
  final List<Person> characters;
  final String nextUrl;

  const CharacterState({required this.characters, required this.nextUrl});

  @override
  List<Object?> get props => [characters, nextUrl];
}