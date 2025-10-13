import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navi_bloc.dart';

class NaviScreen extends StatelessWidget {
  const NaviScreen({Key? key}) : super(key: key);
  static const String route = "navi";
  static const double iconSize = 28;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NaviBloc(),
      child: BlocBuilder<NaviBloc, NaviState>(
          builder: (BuildContext context, NaviState state) {
            return Scaffold(
              body: IndexedStack(index: state.index, children: state.screens),
              extendBody: true,
              bottomNavigationBar: BottomNavigationBar(
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  backgroundColor: ThemeData.dark().primaryColor,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.pink[800],
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
                  //selectedLabelStyle: tsTab,
                  currentIndex: state.index,
                  items: _getNavigationItems(),
                  onTap: (index) {
                    context.read<NaviBloc>().add(NaviEvent(index));
                  }),

            );
          }),
    );
  }

  List<BottomNavigationBarItem> _getNavigationItems() {
    return [
      BottomNavigationBarItem(
        activeIcon: Icon(CupertinoIcons.person_crop_circle_fill),
          icon:Icon(CupertinoIcons.person_crop_circle),
          label: 'Персонажи'),
      BottomNavigationBarItem(
        activeIcon: Icon(CupertinoIcons.star_circle_fill),
          icon: Icon(CupertinoIcons.star_circle),
          label: 'Избранные'
      ),
    ];
  }
}