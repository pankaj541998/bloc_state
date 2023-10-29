part of 'bloc_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {} 

class CartRemovesSuccessEvent extends CartEvent {
  final ProductDataModel cartList;

  CartRemovesSuccessEvent({required this.cartList});
}




