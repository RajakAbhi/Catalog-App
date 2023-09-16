
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:food/pages/home_Widgets/AddtoCart.dart';
import 'package:food/pages/utils/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:food/models/catalog.dart';

class HomedetailPage extends StatelessWidget {
  const HomedetailPage({
    Key? key,
    required this.catalog,
  // ignore: unnecessary_null_comparison
  }) : assert(catalog != null),
     super(key: key);
 final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl4.red800.make(),
                AddToCart(catalog : catalog,
                ).wh(120,50)
              ],
            ).p32()
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.asset(catalog.image)).h32(context),
              Expanded(child: VxArc(
                height: 30, 
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child:Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
            catalog.name.text.bold.xl4.color(MyTheme.darkBluishColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).xl.make(),
            10.heightBox,
            "Et justo amet dolor est tempor invidunt. Erat invidunt amet amet accusam sit consetetur, takimata.".
            text.textStyle(context.captionStyle).make().p16()
                    ]
                  ).py64(),
                )))
          ],
        ),
         
      ),
    );

  }
}
