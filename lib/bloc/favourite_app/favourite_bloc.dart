import 'package:demo_app/bloc/favourite_app/favourite_event.dart';
import 'package:demo_app/bloc/favourite_app/favourite_state.dart';
import 'package:demo_app/model/favourite_item_model.dart';
import 'package:demo_app/repository/favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavouriteListEvent, FavouriteItemState> {
  List<FavouriteItemModel> _favouriteList = [];
  List<FavouriteItemModel> _tempFavouriteList = [];
  FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemState()) {
    on<FetchFavouriteList>(_fetchItem);
    on<FavouriteIcon>(_toggleFavourite);
    on<SelectFavouriteItem>(_selectFavourite);
    on<DeleteItemsEvent>(_deleteItem);
  }

  void _fetchItem(
      FetchFavouriteList event, Emitter<FavouriteItemState> emit) async {
    _favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteListItem: List.from(_favouriteList),
        listStatus: ListStatus.success));
  }

  void _toggleFavourite(FavouriteIcon event, Emitter<FavouriteItemState> emit) {
    // FavouriteItemModel model = FavouriteItemModel(
    //     id: _favouriteList[event.index].id,
    //     value: _favouriteList[event.index].value,
    //     isDeleting: _favouriteList[event.index].isDeleting,
    //     isFavourite: _favouriteList[event.index].isFavourite ? false : true);
    // _favouriteList[event.index] = model;

    int index =
        _favouriteList.indexWhere((element) => element.id == event.item.id);
    _favouriteList[index] = event.item;

    emit(state.copyWith(favouriteListItem: List.from(_favouriteList)));
  }

  void _selectFavourite(
      SelectFavouriteItem event, Emitter<FavouriteItemState> emit) {
    int index =
        _favouriteList.indexWhere((element) => element.id == event.item.id);
    _favouriteList[index] = event.item;

    emit(state.copyWith(favouriteListItem: List.from(_favouriteList)));
  }

  void _deleteItem(DeleteItemsEvent event, Emitter<FavouriteItemState> emit) {
    _favouriteList.removeWhere((element) => element.isDeleting == true);

    emit(state.copyWith(favouriteListItem: List.from(_favouriteList)));
  }
}
