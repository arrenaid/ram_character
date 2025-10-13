import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:ram_character/screens/favorites_screen.dart';
import '../screens/main_screen.dart';

part 'navi_event.dart';
part 'navi_state.dart';

class NaviBloc extends Bloc<NaviEvent, NaviState> {
  final int discoverIndex = 1;

  NaviBloc()
      : super(const NaviState(0, [
    MainScreen(key: Key('6')),
    FavoritesScreen()
  ])) {
    on<NaviEvent>(_onNavi);
    on<SwitchNaviEvent>(_onSwitch);
  }

  _onNavi(NaviEvent event, Emitter emit) {
    emit(NaviState(event.index, state.screens));
  }
  _onSwitch(SwitchNaviEvent event, Emitter emit){
    List<Widget> twin =[];
    twin.addAll(state.screens);
    twin[0] = twin.first.key == const MainScreen(key: Key('6')).key
        ?  FavoritesScreen()
        :  MainScreen(key: Key('6'));
    emit(NaviState(state.index, twin));
  }
}
