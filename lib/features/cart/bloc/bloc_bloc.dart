import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_statemenagement/data/cart_list.dart';
import 'package:meta/meta.dart';

import '../../home/model/home_product_model.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(blocInitialEvent);
    on<CartRemovesSuccessEvent>(cartRemovesSuccessEvent);
  }

  FutureOr<void> blocInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartList: cartList));
  }

  FutureOr<void> cartRemovesSuccessEvent(CartRemovesSuccessEvent event, Emitter<CartState> emit) {
    cartList.remove(event.cartList);
    emit(CartSuccessState(cartList: cartList));
  }
}
