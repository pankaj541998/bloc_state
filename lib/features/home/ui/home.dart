import 'package:bloc_statemenagement/features/home/bloc/bloc_bloc.dart';
import 'package:bloc_statemenagement/features/home/ui/product_tile.dart';
import 'package:bloc_statemenagement/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/cart_list.dart';
import '../../../data/wishlist_list.dart';
import '../../cart/ui/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    print('cart list $cartList');
    print('wishlist  list $wishlistList');
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNaviogateCartState) {
          print('think');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        } else if (state is HomeNaviogateWishlistState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Wishlistcreen(),
            ),
          );
        } else if (state is HomeSnackBarCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to Cart'),
            ),
          );
        } else if (state is HomeSnackBarWishlistState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to Wishlist'),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoddedSuccessState:
            final succesState = state as HomeLoddedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                actions: [
                  Align(
                    alignment: Alignment.center,
                    child: Badge.count(
                      count: wishlistList.length,
                      child: GestureDetector(
                        onTap: () {
                          homeBloc.add(HomeWishlistNavigateButtonEvent());
                        },
                        child: const Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                   SizedBox(width: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Badge.count(
                      count: cartList.length,
                      child: GestureDetector(
                        onTap: () {
                          homeBloc.add(HomeCartNavigateButtonEvent());
                        },
                        child: const Icon(Icons.shopping_bag_outlined),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: succesState.products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProductListWidget(
                          productDataModel: succesState.products[index],
                          homeBloc: homeBloc,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
