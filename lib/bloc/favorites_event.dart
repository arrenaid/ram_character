part of 'favorites_bloc.dart';
class FavoritesEvent extends Equatable{
  const FavoritesEvent();
  @override
  List<Object?> get props => [];
}
class SortedEvent extends FavoritesEvent{
  final List<Person> favorites;

  const SortedEvent({required this.favorites});

  @override
  List<Object?> get props => [favorites];
}
class SetIndexEvent extends FavoritesEvent{
  final int index;
  const SetIndexEvent(this.index) : super();
  @override
  List<Object?> get props => [index];
}
class GetTagsEvent extends FavoritesEvent{}
class AddFavoriteEvent extends FavoritesEvent{
  final Person favorite;

  AddFavoriteEvent({required this.favorite});

  @override
  List<Object?> get props => [favorite];
}
class RemoveFavoriteEvent extends FavoritesEvent{
  final Person favorite;
  RemoveFavoriteEvent({required this.favorite});

  @override
  List<Object?> get props => [favorite];
}