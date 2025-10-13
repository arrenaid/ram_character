import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_character/bloc/favorites_bloc.dart';

import '../models/person.dart';

class PersonSector extends StatefulWidget {
  const PersonSector({super.key, required this.person});

  final Person person;

  @override
  State<PersonSector> createState() => _PersonSectorState();
}

class _PersonSectorState extends State<PersonSector> {

  late bool mark;

  @override
  void initState() {
    mark = false;
    super.initState();
  }

  _set(bool value){
    setState(() {
      mark = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    _set(context.read<FavoritesBloc>().consist(widget.person));
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
              image: widget.person.image,
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
                Text('Имя: ${widget.person.name}', overflow: TextOverflow.ellipsis),
                Text('Статус: ${widget.person.status}', overflow: TextOverflow.ellipsis),
                Text('Расса: ${widget.person.species}, Пол: ${widget.person.gender}.', overflow: TextOverflow.ellipsis),
                Text('Колличество серий: ${widget.person.episode.length}', overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              if (mark) {
                context.read<FavoritesBloc>().add(
                  RemoveFavoriteEvent(favorite: widget.person),
                );
              } else {
                context.read<FavoritesBloc>().add(
                  AddFavoriteEvent(favorite: widget.person),
                );
              }
              _set(!mark);
            },
            icon: mark
                ? Icon(CupertinoIcons.star_fill, color:  Colors.pink[800],)
                : Icon(
                    CupertinoIcons.star,
                    color: ThemeData.dark().primaryColor,
                  ),
          ),
        ],
      ),
    );
  }
}
