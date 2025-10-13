import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_character/bloc/favorites_bloc.dart';

import '../widgets/person_sector.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const String route = "favo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FavoritesBloc,FavoritesState>(
          builder: (context,state){
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 45,
                    child: OverflowBox(
                      maxWidth: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 16),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int indexChip) {
                          return ChoiceChip(
                            shape: const StadiumBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                            ),
                            label: Text(state.tags[indexChip]),
                            elevation: 0,
                            padding: const EdgeInsets.all(10),
                            selected: state.index == indexChip,
                            selectedColor: Colors.pink[800],
                            // disabledColor: Colors.black,
                            backgroundColor: Colors.black,
                            onSelected: (selected) {
                              context.read<FavoritesBloc>().add(
                                SetIndexEvent(indexChip),
                              );
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(width: 8),
                        itemCount: state.tags.length,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemCount: state.sorted.length,
                itemBuilder: (context, index) {
                  return PersonSector(
                    person: state.sorted[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
              ),

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
