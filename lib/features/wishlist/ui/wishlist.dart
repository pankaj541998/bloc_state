import 'package:flutter/material.dart';

class Wishlistcreen extends StatefulWidget {
  const Wishlistcreen({super.key});

  @override
  State<Wishlistcreen> createState() => _WishlistcreenState();
}

class _WishlistcreenState extends State<Wishlistcreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist Screen'),),
    );
  }
}