part of 'bloc_bloc.dart';

@immutable
abstract class HomeEvent {}


class HomeInitialEvent extends HomeEvent {
  
}

class HomeWislishtButtonEvent extends HomeEvent {}

class HomeCartButtonEvent extends HomeEvent {}

class HomeWishlistNavigateButtonEvent extends HomeEvent {}

class HomeCartNavigateButtonEvent extends HomeEvent {}
