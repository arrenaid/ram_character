part of 'navi_bloc.dart';

class NaviState {
  final int index;
  final List<Widget> screens;

  const NaviState(this.index, this.screens);

  List<Object?> get props => [index, screens];
}
