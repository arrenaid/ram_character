import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_character/bloc/character_bloc.dart';
import 'package:ram_character/bloc/favorites_bloc.dart';
import 'package:ram_character/repositories/ram_repository.dart';
import 'package:ram_character/screens/favorites_screen.dart';
import 'package:ram_character/screens/main_screen.dart';
import 'package:ram_character/screens/navi_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => RamRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharacterBloc(
              repository: RepositoryProvider.of<RamRepository>(context),
            )..add(GetCharacterEvent()),
          ),
          BlocProvider(create: (context) => FavoritesBloc()),
        ],
        child: MaterialApp(
          title: 'Rick And Morty Character',
          theme: ThemeData.dark(),
          routes: {
            MainScreen.route: (context) => const MainScreen(),
            NaviScreen.route: (context) => const NaviScreen(),
            FavoritesScreen.route: (context) => const FavoritesScreen(),
          },
          initialRoute: NaviScreen.route,
        ),
      ),
    );
  }
}
