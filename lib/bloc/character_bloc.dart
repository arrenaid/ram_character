import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ram_character/repositories/ram_repository.dart';

import '../models/person.dart';

part 'character_state.dart';

part 'character_event.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final RamRepository repository;

  CharacterBloc({required this.repository}) : super(CharacterState(characters: [])) {
    on<GetCharacterEvent>(_load);
  }

  _load(GetCharacterEvent event, Emitter emit) async {
    try {
      List<Person> result = await repository.getCharacter();
      emit( CharacterState(characters: result));

    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
