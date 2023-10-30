// ignore_for_file: must_be_immutable

import 'package:bloc_statemenagement/features/home/bloc/bloc_bloc.dart';
import 'package:bloc_statemenagement/features/home/model/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  HomeBloc homeBloc = HomeBloc();
  ProductListWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

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
                            homeBloc.add(
                              HomeWislishtButtonEvent(
                                wishlistClicked: productDataModel,
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            homeBloc.add(HomeCartButtonEvent(
                              cartListClicked: productDataModel,
                            ));
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
