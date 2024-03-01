import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  String id;
  String value;
  bool isDeleting;
  bool isFavourite;

  FavouriteItemModel(
      {required this.id,
      required this.value,
      this.isDeleting = false,
      this.isFavourite = false});

  FavouriteItemModel copyWith(
      {String? id, String? value, bool? isDeleting, bool? isFavourite}) {
    return FavouriteItemModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
