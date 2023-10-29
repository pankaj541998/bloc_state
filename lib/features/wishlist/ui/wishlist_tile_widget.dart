// ignore_for_file: must_be_immutable
import 'package:bloc_statemenagement/features/home/model/home_product_model.dart';
import 'package:bloc_statemenagement/features/wishlist/bloc/bloc_bloc.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  WishlistBloc wishlistBloc= WishlistBloc();
  WishlistTileWidget({super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            productDataModel.imageUrl,
            // height: 100,
            // width: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productDataModel.name,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  productDataModel.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${productDataModel.price}',
                      style: const TextStyle(fontSize: 17),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            wishlistBloc.add(WishlistRemoveSuccessEvent(wishlistList: productDataModel));
                          },
                          icon: const Icon(
                            Icons.favorite,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                           
                          },
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
