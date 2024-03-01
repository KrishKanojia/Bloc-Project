import 'package:demo_app/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemState extends Equatable {
  final List<FavouriteItemModel> favouriteListItem;

  final ListStatus listStatus;

  const FavouriteItemState(
      {this.favouriteListItem = const [],
      this.listStatus = ListStatus.loading});

  FavouriteItemState copyWith(
      {List<FavouriteItemModel>? favouriteListItem,
      ListStatus? listStatus,
      List<FavouriteItemModel>? tempFavouriteListItem}) {
    return FavouriteItemState(
        favouriteListItem: favouriteListItem ?? this.favouriteListItem,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favouriteListItem, listStatus];
}
