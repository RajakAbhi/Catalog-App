// ignore_for_file: file_names

import 'package:food/core/store.dart';
import 'package:food/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{
   late CatalogModel _catalog;


//collection of ids - store ids for each item
  final List<int> _itemids = [];

  //Get catalog
CatalogModel get catalog => _catalog;
set catalog(CatalogModel newCatalog) {
  // ignore: unnecessary_null_comparison
  assert(newCatalog != null);
  _catalog = newCatalog;
}

//get items in the cart
List<Item> get items => _itemids.map((id) => _catalog.getById(id)).toList();

//get total price
num get totalprice => items.fold(0, (total, current) => total+current.price);
}

class Addmutation extends VxMutation<MyStore> {
  final Item item;

  Addmutation(this.item);
  
  @override
  perform() {
    store?.cart._itemids.add(item.id);
  }
  }

  class Removemutation extends VxMutation<MyStore> {
  final Item item;

  Removemutation(this.item);
  
  @override
  perform() {
    store?.cart._itemids.remove(item.id);
  }
  }