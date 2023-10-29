part of 'bloc_bloc.dart';

@immutable
abstract class CartState {}
abstract class CartActionState  extends CartState {}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState {
  final List<ProductDataModel> cartList;
  CartSuccessState({required this.cartList});
}

// final class CartRemovesSuccessState extends CartState {
//   final List<ProductDataModel> cartList;
//   CartRemovesSuccessState({required this.cartList});
// }

