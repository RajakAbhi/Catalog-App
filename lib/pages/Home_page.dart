// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, prefer_const_constructors, avoid_types_as_parameter_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/core/store.dart';
import 'package:food/models/Cart.dart';
import 'package:food/pages/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:food/models/catalog.dart';
import 'package:food/pages/utils/widgets/theme.dart';

// ignore: unused_import
import 'home_Widgets/Catalog_header.dart';
import 'home_Widgets/Catalog_list.dart';
// ignore: unused_import

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final imageUrl = "https://images.news18.com/ibnlive/uploads/2022/03/ankit-tiwari-1.jpg";

@override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async{
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedata = jsonDecode(catalogJson);
    var productdata = decodedata["products"];
    CatalogModel.items = List.from(productdata)
    .map<Item>((item)=>Item.fromMap(item)).toList();
   setState(() { });
  }
@override
 // ignore: dead_code
 Widget build(BuildContext context) {
  // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
  final _cart= (VxState.store as MyStore).cart;
      return   Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
   // ignore: non_constant_identifier_names
   builder: ( context, MyStore, _) =>  FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, 
            MyRoutes.CartRoute),
            backgroundColor: MyTheme.darkBluishColor,
            child: Icon(CupertinoIcons.cart,
            color: Colors.white,),
            ).badge(color: Vx.red500,size: 22,count: _cart.items.length,
            textStyle: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),
            ),
             // ignore: prefer_const_literals_to_create_immutables
             mutations: {Addmutation , Removemutation},
        ),
       body: SafeArea(
         child: Container(
          padding: Vx.m32,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CatalogHeader(),
              // ignore: unnecessary_null_comparison
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
              else
               CircularProgressIndicator().centered().expand(),
            ],
           ),
         ),
       ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Ankit Rajak"),
                 accountEmail: Text(" ar18072001@gmail.com"),
                 currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings), title: Text("Setting"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts), title: Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
            )
            );
    }
}

