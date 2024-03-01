import 'package:demo_app/bloc/favourite_app/favourite_bloc.dart';
import 'package:demo_app/bloc/favourite_app/favourite_event.dart';
import 'package:demo_app/bloc/favourite_app/favourite_state.dart';
import 'package:demo_app/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        centerTitle: true,
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteItemState>(
              builder: ((context, state) {
            return Visibility(
              visible: state.favouriteListItem
                      .any((element) => element.isDeleting == true)
                  ? true
                  : false,
              child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteItemsEvent());
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          }))
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteItemState>(
          builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ListStatus.failure:
            return const Center(child: Text("Error"));
          case ListStatus.success:
            return ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: state.favouriteListItem.length,
              itemBuilder: ((context, index) {
                FavouriteItemModel itemModel = state.favouriteListItem[index];
                return Card(
                  child: ListTile(
                    leading: Checkbox(
                        value: itemModel.isDeleting,
                        onChanged: (value) {
                          FavouriteItemModel model = FavouriteItemModel(
                              id: itemModel.id,
                              value: itemModel.value,
                              isDeleting: value!,
                              isFavourite: itemModel.isFavourite);

                          context
                              .read<FavouriteBloc>()
                              .add(SelectFavouriteItem(item: model));
                        }),
                    title: Text(itemModel.value.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          FavouriteItemModel model = FavouriteItemModel(
                              id: itemModel.id,
                              value: itemModel.value,
                              isDeleting: itemModel.isDeleting,
                              isFavourite:
                                  itemModel.isFavourite ? false : true);

                          context
                              .read<FavouriteBloc>()
                              .add(FavouriteIcon(item: model));
                        },
                        icon: Icon(
                          itemModel.isFavourite == false
                              ? Icons.favorite_outline_sharp
                              : Icons.favorite,
                        )),
                  ),
                );
              }),
            );
        }
      }),
    );
  }
}
