part of 'bloc_bloc.dart';

@immutable
abstract class HomeEvent {}


class HomeInitialEvent extends HomeEvent {
  
}
//Button Clicked Event
class HomeWislishtButtonEvent extends HomeEvent {
  final ProductDataModel wishlistClicked;

  HomeWislishtButtonEvent({required this.wishlistClicked});
}

class HomeCartButtonEvent extends HomeEvent {
  final ProductDataModel cartListClicked;

  HomeCartButtonEvent({required this.cartListClicked});
}

// Navigate State

class HomeWishlistNavigateButtonEvent extends HomeEvent {}

class HomeCartNavigateButtonEvent extends HomeEvent {}
