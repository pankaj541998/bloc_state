part of 'bloc_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoddedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoddedSuccessState({ required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNaviogateWishlistState extends HomeActionState {}

class HomeNaviogateCartState extends HomeActionState {}

class HomeSnackBarWishlistState extends HomeActionState {}

class HomeSnackBarCartState extends HomeActionState {}
