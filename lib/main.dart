import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_character/bloc/character_bloc.dart';
import 'package:ram_character/bloc/favorites_bloc.dart';
import 'package:ram_character/repositories/ram_repository.dart';
import 'package:ram_character/repositories/shared_preferences_repository.dart';
import 'package:ram_character/screens/favorites_screen.dart';
import 'package:ram_character/screens/main_screen.dart';
import 'package:ram_character/screens/navi_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (BuildContext context) => RamRepository()),
        RepositoryProvider(
          create: (context) => SharedPreferencesRepository(prefs: prefs),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharacterBloc(
              repository: RepositoryProvider.of<RamRepository>(context),
            )..add(GetCharacterEvent()),
          ),
          BlocProvider(
            create: (context) => FavoritesBloc(
              prefs: RepositoryProvider.of<SharedPreferencesRepository>(
                context,
              ),
            )..add(UpdatePrefsEvent()),
          ),
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
