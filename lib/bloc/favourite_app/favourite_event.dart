import 'package:demo_app/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteListEvent extends Equatable {
  const FavouriteListEvent();
  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteListEvent {}

class FavouriteIcon extends FavouriteListEvent {
  final FavouriteItemModel item;

  const FavouriteIcon({required this.item});
}

class SelectFavouriteItem extends FavouriteListEvent {
  final FavouriteItemModel item;

  const SelectFavouriteItem({required this.item});
}

class DeleteItemsEvent extends FavouriteListEvent {}
