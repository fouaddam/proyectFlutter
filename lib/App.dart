

import 'package:flutter/material.dart';

import 'entities/Login_View.dart';
import 'entities/Register_View.dart';

class App extends StatefulWidget{

  App({Key? key}):super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes:{
        '/Login':(context)=>Login_View(),
        '/Register':(context)=>Register_View(),
      },
      initialRoute: '/Login',
    );
  }
}

