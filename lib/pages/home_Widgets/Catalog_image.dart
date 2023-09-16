// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class CatalogImage extends StatelessWidget {
 final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(image).box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
  }
}