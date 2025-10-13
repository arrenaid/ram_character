part of 'navi_bloc.dart';

class NaviEvent extends Equatable {
  final int index;

  const NaviEvent(this.index);

  @override
  List<Object?> get props => [index];
}
class SwitchNaviEvent extends NaviEvent{
  final String title;
  SwitchNaviEvent(super.index, this.title);
  @override
  List<Object?> get props => [title];
}
