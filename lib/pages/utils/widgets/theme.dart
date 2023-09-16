// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
       cardColor: Colors.white,
        canvasColor: creamColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        foregroundColor: darkBluishColor,
      )
      );
      
      static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        
      )
      );

      //colors
      static Color creamColor = Color(0xfff5f5f5);
      static Color darkcreamColor = Vx.gray900;
      static Color darkBluishColor = Color(0xff403b58);
      static Color lightBluishColor = Vx.indigo500;

     
}