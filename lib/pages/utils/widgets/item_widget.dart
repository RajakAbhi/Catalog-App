// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:food/models/catalog.dart';

class ItemWidget extends StatelessWidget {

final Item item;

  // ignore: unnecessary_null_comparison
  const ItemWidget({super.key, required this.item}):assert (Item != null);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        
        // ignore: duplicate_ignore, duplicate_ignore
      leading: ConstrainedBox(
            constraints:  BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image.asset(item.image),
      ),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text("\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
          ),
          ),
      ),
    );
  }
}