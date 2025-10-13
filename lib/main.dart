import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_character/bloc/character_bloc.dart';
import 'package:ram_character/repositories/ram_repository.dart';
import 'package:ram_character/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => RamRepository(),
      child: BlocProvider(
        create: (BuildContext context) =>
            CharacterBloc(repository: RepositoryProvider.of(context))
              ..add(GetCharacterEvent()),
        child: MaterialApp(
          title: 'Rick And Morty Character',
          theme: ThemeData.dark(),
          home: const MainScreen(),
        ),
      ),
    );
  }
}
