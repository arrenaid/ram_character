import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_character/bloc/favorites_bloc.dart';
import 'package:ram_character/constants.dart';
import '../models/person.dart';

class PersonSector extends StatefulWidget {
  const PersonSector({super.key, required this.person});

  final Person person;

  @override
  State<PersonSector> createState() => _PersonSectorState();
}

class _PersonSectorState extends State<PersonSector> {
  late bool mark;
  double scale = 1.0;
  double turn = 0;

  void _changeScale() {
    setState(() => scale = scale == 1.0 ? 1.4 : 1.0);
  }

  void _changeTurn() {
    setState(() => turn = turn == 0 ? 1 : 0);
  }

  @override
  void initState() {
    mark = false;
    super.initState();
  }

  _set(bool value) {
    setState(() {
      mark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    _set(context.read<FavoritesBloc>().consist(widget.person));
    return Container(
      height: 125,
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
              height: 100,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    text: 'Имя: ',
                    style: tsNeue,
                    children: [
                      TextSpan(text: widget.person.name, style: tsMacherie),
                    ],
                  ),
                ),
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    text: 'Статус: ',
                    style: tsNeue,
                    children: [
                      TextSpan(text: widget.person.status, style: tsMacherie),
                    ],
                  ),
                ),

                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    text: 'Расса: ',
                    style: tsNeue,
                    children: [
                      TextSpan(text: widget.person.species, style: tsMacherie),
                    ],
                  ),
                ),
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    text: 'Пол: ',
                    style: tsNeue,
                    children: [
                      TextSpan(text: widget.person.gender, style: tsMacherie),
                    ],
                  ),
                ),
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    text: 'Колличество серий: ',
                    style: tsNeue,
                    children: [
                      TextSpan(text: '${widget.person.episode.length}', style: tsMacherie),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _changeScale();
              _changeTurn();
            },
            icon: AnimatedRotation(
              duration: const Duration(milliseconds: 500),
              turns: turn,
              onEnd: () {
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
              child: AnimatedScale(
                scale: scale,
                duration: const Duration(milliseconds: 250),
                curve: Curves.fastOutSlowIn,
                onEnd: () {
                  if (scale == 1.4) {
                    _changeScale();
                  }
                },
                child: mark
                    ? Icon(CupertinoIcons.star_fill, color: Colors.pink[800])
                    : Icon(
                        CupertinoIcons.star,
                        color: ThemeData.dark().primaryColor,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
