// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:food/pages/Login_page.dart';
import 'package:food/pages/cart_page.dart';
import 'package:food/pages/utils/routes.dart';
import 'package:food/pages/utils/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';
import 'pages/Home_page.dart';
void main() {
  runApp(VxState(store: MyStore(),
  
  child: const Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // ignore: prefer_const_constructors

      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute, 
      routes: {
        // ignore: prefer_const_constructors
        "/" : (context) => HomePage(),
        // ignore: prefer_const_constructors, 
        MyRoutes.HomeRoute: (context) => HomePage(),
        // ignore: prefer_const_constructors
        MyRoutes.loginRoute: (context) => LoginPage(),
        // ignore: prefer_const_constructors
        MyRoutes.CartRoute:(context) => CartPage(),
      },
    );
  }
}
