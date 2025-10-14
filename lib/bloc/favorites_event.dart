part of 'favorites_bloc.dart';
class FavoritesEvent extends Equatable{
  const FavoritesEvent();
  @override
  List<Object?> get props => [];
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
class UpdatePrefsEvent extends FavoritesEvent{}