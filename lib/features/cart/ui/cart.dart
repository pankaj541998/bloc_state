import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_bloc.dart';
import 'cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
   cartBloc.add(CartInitialEvent());
    super.initState();
  }
  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
            final successtate = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successtate.cartList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                      productDataModel: successtate.cartList[index],
                      cartBloc: cartBloc,
                    );
                  },
                );
            default:
          }
          return SizedBox();
        },
      ),
    );
  }
}
