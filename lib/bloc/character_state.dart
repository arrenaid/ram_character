part of 'character_bloc.dart';

class CharacterState extends Equatable {
  final List<Person> characters;

  const CharacterState({required this.characters});

  @override
  List<Object?> get props => [characters];
}