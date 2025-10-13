part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final List<Person> sorted;
  final List<Person> favorites;
  final List<String> tags;
  final int index;

  const FavoritesState({
    required this.sorted,
    required this.favorites,
    required this.tags,
    required this.index,
  });

  @override
  List<Object?> get props => [sorted, favorites, tags, index];

  copyWith({
    List<Person>? sorted,
    List<Person>? favorites,
    List<String>? tags,
    int? index,
  }) {
    return FavoritesState(
      sorted: sorted ?? this.sorted,
      favorites: favorites ?? this.favorites,
      tags: tags ?? this.tags,
      index: index ?? this.index,
    );
  }
}
