import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/bloc/favorite_app/favorite_app_event.dart';
import 'package:flutter_bloc_demo/bloc/favorite_app/favorite_app_state.dart';

import '../../model/favorite_item_model.dart';
import '../../repository/favorite_repository.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvent, FavoriteAppState> {
  FavoriteRepository favoriteRepository;
  List<FavoriteItemModel> favoriteItemsList = [];
  List<FavoriteItemModel> tempFavoriteItemsList = [];

  FavoriteAppBloc(this.favoriteRepository) : super(const FavoriteAppState()) {
    on<FetchFavoriteList>(_fetchFavoriteList);
    on<AddItemToFavorite>(_addItemToFavorite);
    on<SelectFavoriteItem>(_selectFavoriteItem);
    on<UnSelectFavoriteItem>(_unSelectFavoriteItem);
    on<DeleteItem>(_deleteItem);
  }

  void _fetchFavoriteList(
      FetchFavoriteList event, Emitter<FavoriteAppState> emit) async {
    favoriteItemsList = await favoriteRepository.fetchItems();
    emit(state.copyWith(
        favoriteItems: List.from(favoriteItemsList),
        listStatus: ListStatus.success));
  }

  void _addItemToFavorite(
      AddItemToFavorite event, Emitter<FavoriteAppState> emit) {
    final index =
        favoriteItemsList.indexWhere((element) => element.id == event.item.id);

    if (event.item.isFavorite) {
      if (tempFavoriteItemsList.contains(favoriteItemsList[index])) {
        tempFavoriteItemsList.remove(favoriteItemsList[index]);
        tempFavoriteItemsList.add(event.item);
      }
    } else {
      if (tempFavoriteItemsList.contains(favoriteItemsList[index])) {
        tempFavoriteItemsList.remove(favoriteItemsList[index]);
        tempFavoriteItemsList.add(event.item);
      }
    }

    favoriteItemsList[index] = event.item;
    emit(state.copyWith(favoriteItems: List.from(favoriteItemsList), tempFavoriteItems: List.from(tempFavoriteItemsList)));
  }

  void _selectFavoriteItem(
      SelectFavoriteItem event, Emitter<FavoriteAppState> emit) {
    tempFavoriteItemsList.add(event.item);
    emit(state.copyWith(tempFavoriteItems: List.from(tempFavoriteItemsList)));
  }

  void _unSelectFavoriteItem(
      UnSelectFavoriteItem event, Emitter<FavoriteAppState> emit) {
    tempFavoriteItemsList.remove(event.item);
    emit(state.copyWith(tempFavoriteItems: List.from(tempFavoriteItemsList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavoriteAppState> emit) {
    for (int i = 0; i < tempFavoriteItemsList.length; i++) {
      favoriteItemsList.remove(tempFavoriteItemsList[i]);
    }
    tempFavoriteItemsList.clear();
    emit(
      state.copyWith(
        favoriteItems: List.from(favoriteItemsList),
        tempFavoriteItems: List.from(tempFavoriteItemsList),
      ),
    );
  }
}
