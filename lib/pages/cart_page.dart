// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:food/core/store.dart';
import 'package:food/models/Cart.dart';
// ignore: unused_import
import 'package:food/pages/utils/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent,
      title: "Cart".text.make()),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          cartTotal(),
        ],
      ),
    );
  }
}

class cartTotal extends StatelessWidget {
  const cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
   final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           VxBuilder(
            builder: (context,MyStore,_ ) {
                return "\$${_cart.totalprice}".
                text.xl5.color(MyTheme.darkBluishColor).make();
            },
            mutations: {Removemutation}),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: "Buying not supported yet".text.make()
            ));
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor)),
             child: "Buy".text.white.make(),
             ).w32(context)
        ],
      ),
    );
  }
}

// ignore: unused_element
class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Removemutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty?
    "Nothing to show".text.xl3.makeCentered() :ListView.builder(
      itemCount: _cart.items.length, 
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () => Removemutation(_cart.items[index]),
          ) ,
          title: _cart.items[index].name.text.make(),
      ) ,
    );
  }
}