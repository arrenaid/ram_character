import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/person.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc()
    : super(
        FavoritesState(
          sorted: [],
          favorites: [],
          index: 0,
          tags: ['все', 'эпизоды'],
        ),
      ) {
    on<SetIndexEvent>(_change);
    on<GetTagsEvent>(_getTag);
    on<AddFavoriteEvent>(_new);
    on<RemoveFavoriteEvent>(_delete);
  }

  _change(SetIndexEvent event, Emitter emit) {
    var result = _sort(state, event.index);
    emit(state.copyWith(index: event.index, sorted: result));
  }

  _getTag(GetTagsEvent event, Emitter emit) {
    List<String> result = ['все', 'эпизоды'];
    for (var e in state.favorites) {
      result.add(e.gender);
      result.add(e.species);
      result.add(e.status);
    }
    Set<String> twin = result.toSet();
    emit(state.copyWith(tags: twin.toList()));
  }

  _new(AddFavoriteEvent event, Emitter emit) {
    var result = state.favorites;
    result.add(event.favorite);
    emit(state.copyWith(favorites: result));
    _getTag(GetTagsEvent(), emit);
  }

  List<Person> _sort(FavoritesState state, int index) {
    if (index != 0) {
      if (index == 1) {
        List<Person> result = [];
        List<Person> twin = state.favorites.toList();

        int index = 0;
        for (var x in state.sorted) {
          if (state.sorted.first.episode.length >= x.episode.length) {
            index++;
          }
        }
        bool isAscending = index < twin.length? true: false;


        for (int i = 0; i < state.favorites.length; i++) {
          var del = twin.first;
          if(isAscending) {
            for (var x in twin) {
              if (del.episode.length < x.episode.length) {
                del = x;
              }
            }
          } else {
            for (var x in twin) {
              if (del.episode.length > x.episode.length) {
                del = x;
              }
            }
          }
          result.add(del);
          twin.remove(del);
        }
        return result;
      }
      List<Person> twin = [];
      for (var e in state.favorites) {
        if (e.gender == state.tags[index] ||
            e.species == state.tags[index] ||
            e.status == state.tags[index]) {
          twin.add(e);
        }
      }
      return twin;
    }
    return state.favorites;
  }

  _delete(RemoveFavoriteEvent event, Emitter emit) {
    var result = state.favorites;
    result.remove(event.favorite);
    emit(state.copyWith(favorites: result));
    _getTag(GetTagsEvent(), emit);
  }

  bool consist(Person character) {
    return state.favorites.contains(character);
  }
}
