import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ram_character/repositories/ram_repository.dart';
import '../models/person.dart';

part 'character_state.dart';

part 'character_event.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final RamRepository repository;

  CharacterBloc({required this.repository})
    : super(CharacterState(characters: [], nextUrl: '')) {
    on<GetCharacterEvent>(_load);
    on<NextPageEvent>(_next);
  }

  _load(GetCharacterEvent event, Emitter emit) async {
    try {
      var result = await repository.getCharacter();
      emit(
        CharacterState(
          characters: result.results,
          nextUrl: result.info.next ?? '',
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _next(NextPageEvent event, Emitter emit) async {
    if (state.nextUrl.isNotEmpty) {
      try {
        var result = await repository.getCharacter(url: state.nextUrl);
        List<Person> twin = state.characters.toList();
        twin.addAll(result.results);
        emit(CharacterState(characters: twin, nextUrl: result.info.next ?? ''));
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
