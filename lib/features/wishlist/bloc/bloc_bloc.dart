import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_list.dart';
import '../../home/model/home_product_model.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveSuccessEvent>(wishlistRemoveSuccessEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistList: wishlistList));
  }

  FutureOr<void> wishlistRemoveSuccessEvent(WishlistRemoveSuccessEvent event, Emitter<WishlistState> emit) {
    wishlistList.remove(event.wishlistList);
    emit(WishlistSuccessState(wishlistList: wishlistList));
  }
}
