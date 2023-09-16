

// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/Cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:food/pages/utils/Home_detail_page.dart';

import '../../core/store.dart';
import '../../models/catalog.dart';
import '../utils/widgets/theme.dart';
import 'Catalog_image.dart';
class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
      return InkWell(
        onTap: () => Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => HomedetailPage(
              catalog: catalog
              )
              )),
      child: CatalogItem(catalog: catalog),
      );
      },
      );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  // ignore: unnecessary_null_comparison
  }) : assert(catalog!= null),
   super(key: key);
 final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
     child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.lg.color(MyTheme.darkBluishColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.make(),
                _AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
     )
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

class _AddToCart extends StatelessWidget {
   final Item catalog;
   // ignore: prefer_const_constructors_in_immutables
   _AddToCart({
    Key? key,
    // ignore: unused_element
    required this.catalog,
  }) : super(key: key);

   final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    bool isIncart = _cart.items.contains(catalog)   ;
    
    return ElevatedButton(onPressed:() {
      if(! isIncart) {
      Addmutation(catalog);
      //setState(() {});
      }
    }, 
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
      // ignore: prefer_const_constructors
      shape: MaterialStateProperty.all(StadiumBorder())
    ),
    child: isIncart? Icon(Icons.done): Icon(CupertinoIcons.cart_badge_plus),);
  }
}