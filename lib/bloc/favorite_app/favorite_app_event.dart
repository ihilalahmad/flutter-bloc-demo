import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/model/favorite_item_model.dart';

abstract class FavoriteAppEvent extends Equatable {
  const FavoriteAppEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavoriteList extends FavoriteAppEvent {}

class AddItemToFavorite extends FavoriteAppEvent {
  final FavoriteItemModel item;

  const AddItemToFavorite({required this.item});
}

class SelectFavoriteItem extends FavoriteAppEvent {
  final FavoriteItemModel item;

  const SelectFavoriteItem({required this.item});
}

class UnSelectFavoriteItem extends FavoriteAppEvent {
  final FavoriteItemModel item;

  const UnSelectFavoriteItem({required this.item});
}

class DeleteItem extends FavoriteAppEvent {

}
