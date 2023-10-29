import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_statemenagement/features/statics.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../data/grocery_data.dart';
import '../model/home_product_model.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    // called click naviagte events
    on<HomeWishlistNavigateButtonEvent>(homeWishlistNavigateButton);
    on<HomeCartNavigateButtonEvent>(homeCartNavigateButton);

    //called click button events
    on<HomeWislishtButtonEvent>(homeWislishtButtonEvent);
    on<HomeCartButtonEvent>(homeCartButtonEvent);

    on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    print('HomeInitialEvent');

    await Future.delayed(const Duration(seconds: 2));
    emit(
      HomeLoddedSuccessState(
        products: GroceryData.products
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e["name"],
                description: e["description"],
                price: e["price"],
                imageUrl: e["image"],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeWishlistNavigateButton(
      HomeWishlistNavigateButtonEvent event, Emitter<HomeState> emit) {
    debugPrints('HomeWishlistNavigateButtonEvent Clicked');
    emit(HomeNaviogateWishlistState());
  }

  FutureOr<void> homeCartNavigateButton(
      HomeCartNavigateButtonEvent event, Emitter<HomeState> emit) {
    debugPrints('HomeCartNavigateButtonEvent Clicked');
    emit(HomeNaviogateCartState());
  }

  FutureOr<void> homeCartButtonEvent(
      HomeCartButtonEvent event, Emitter<HomeState> emit) {
    print('Cart Button Clicked');
  }

  FutureOr<void> homeWislishtButtonEvent(
      HomeWislishtButtonEvent event, Emitter<HomeState> emit) {
    print('Wishlist Button Clicked');
  }
}
