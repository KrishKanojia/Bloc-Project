import 'package:demo_app/model/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateItem(20));
  }

  List<FavouriteItemModel> _generateItem(int len) {
    return List.generate(
        len,
        (index) => FavouriteItemModel(
            id: index.toString(), value: 'Item ${index.toString()}'));
  }
}
