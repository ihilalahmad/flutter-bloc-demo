import 'package:equatable/equatable.dart';

import '../../model/favorite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavoriteAppState extends Equatable {
  final List<FavoriteItemModel> favoriteItems;
  final List<FavoriteItemModel> tempFavoriteItems;
  final ListStatus listStatus;

  const FavoriteAppState({
    this.favoriteItems = const [],
    this.tempFavoriteItems = const [],
    this.listStatus = ListStatus.loading,
  });

  FavoriteAppState copyWith(
      {List<FavoriteItemModel>? favoriteItems,
      List<FavoriteItemModel>? tempFavoriteItems,
      ListStatus? listStatus}) {
    return FavoriteAppState(
        favoriteItems: favoriteItems ?? this.favoriteItems,
        tempFavoriteItems: tempFavoriteItems ?? this.tempFavoriteItems,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favoriteItems, tempFavoriteItems, listStatus];
}
