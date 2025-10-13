import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_character/bloc/character_bloc.dart';

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
                  image: state.characters[index].image,
                  name: state.characters[index].name,
                  status: state.characters[index].status,
                  species: state.characters[index].species,
                  gender: state.characters[index].gender,
                  type: state.characters[index].type,
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

class PersonSector extends StatelessWidget {
  const PersonSector({
    super.key,
    required this.image,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.type,
  });

  final String image;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.green[800],
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/ram.png',
              placeholderCacheWidth: 50,
              image: image,
              fit: BoxFit.cover,
              height: 75,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Имя: $name'),
                Text('Расса: $species'),
                Text('Статус: $status, Пол: $gender.'),
                Text('$type', overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.star),
          ),
        ],
      ),
    );
  }
}
