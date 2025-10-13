import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_character/bloc/character_bloc.dart';
import '../widgets/person_sector.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String route = "main";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                return PersonSector(
                  person: state.characters[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
            );
          },
        ),
      ),
    );
  }
}