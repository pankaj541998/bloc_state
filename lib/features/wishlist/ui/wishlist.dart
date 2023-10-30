import 'package:bloc_statemenagement/features/wishlist/bloc/bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'wishlist_tile_widget.dart';

class Wishlistcreen extends StatefulWidget {
  const Wishlistcreen({super.key});
  @override
  State<Wishlistcreen> createState() => _WishlistcreenState();
}

class _WishlistcreenState extends State<Wishlistcreen> {
  @override
  void initState() {
  whishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  WishlistBloc whishlistBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: whishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          listener: (context, state) {
          },
          builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
            final successtate = state as WishlistSuccessState;
    
              return ListView.builder(
                  itemCount: successtate.wishlistList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      productDataModel: successtate.wishlistList[index],
                      wishlistBloc: whishlistBloc,
                    );
                  },
                );
            default:
          }
          return const SizedBox();
        },
        ));
  }
}
