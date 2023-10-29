part of 'bloc_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveSuccessEvent extends WishlistEvent {
  final ProductDataModel wishlistList;

  WishlistRemoveSuccessEvent({required this.wishlistList});
}
