// ignore_for_file: file_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:food/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/Cart.dart';
import '../../models/catalog.dart';
import '../utils/widgets/theme.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
   // ignore: prefer_const_constructors_in_immutables
   AddToCart({
    Key? key,
    // ignore: unused_element
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on: [Addmutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isIncart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isIncart) {
          Addmutation(catalog);
          //setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
          // ignore: prefer_const_constructors
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isIncart ? Icon(Icons.done) : "Add to Cart".text.make(),
    );
  }
}
