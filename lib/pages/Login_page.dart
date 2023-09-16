// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:food/pages/utils/routes.dart';
import 'package:food/pages/utils/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: non_constant_identifier_names
   String name = "";
   bool changebutton = false;

   final _formKey = GlobalKey<FormState>();

   moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()) {
                    setState(() {
                      changebutton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    // ignore: use_build_context_synchronously
                    await Navigator.pushNamed(context, MyRoutes.HomeRoute);
                  setState(() {
                    changebutton = false;
                     });
                  }
   }
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Material(
      color: context.canvasColor,
      // ignore: prefer_const_constructors
      child: SingleChildScrollView(
        child:Form(
          key: _formKey,
          child: Column(
                children: [
                  Image.asset("assets/image/hay.png",
                  fit: BoxFit.cover,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20.0,
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    "Welcome $name",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                    child: Column(
                    children:[
                    TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                        return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: ((value) {
                        name = value;
                        setState(() {});
                      }),
                    ),
                  
                    TextFormField(
                      obscureText: true,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "password",
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "password cannot be empty";
                        }
                        else if(value.length<8){
                          return "password length should be atleast 8 characters";
                        }
                        return null;
                      },
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 40.0,
                    ),
              
              Material(
                color: MyTheme.darkBluishColor,
                      borderRadius: BorderRadius.circular(changebutton?50:8),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () => moveToHome(context),
                 
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changebutton? 50:150 ,
                    height: 50,
                    alignment: Alignment.center,
                    // ignore: sort_child_properties_last
                    child: changebutton?Icon(Icons.done,
                    color:Colors.white,)
                   :Text ("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
                    ],
                    ),
                  ),
                ],
              ),
        ),
        ),
      );
  }
} 