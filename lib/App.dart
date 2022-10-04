

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/Home/onBoardingView.dart';
import 'package:proyectoflutter/Home/roomsView.dart';

import 'Home/Home.dart';
import 'entities/Login_View.dart';
import 'entities/Register_View.dart';

class App extends StatefulWidget{

  App({Key? key}):super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  String VerificationUser(){
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser!=null){
      print(currentUser.email);
      return '/onBoarding';
    }else{
      print(currentUser.toString());
      return '/Login';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: VerificationUser(),
      routes:{
        '/Login':(context)=>Login_View(),
        '/Register':(context)=>Register_View(),
        '/Home':(context)=>Home(),
        '/onBoarding':(context)=>onBoardingView(),
        '/rooms':(context)=>roomView()

      },


    );
  }
}



