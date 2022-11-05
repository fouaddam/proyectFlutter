

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoflutter/firebase_options.dart';

import '../Card_view/RoomChatCrid.dart';
import '../Home/Home.dart';
import '../Home/Home2.dart';
import '../Home/SplashView.dart';
import '../Home/onBoardingView.dart';
import '../Home/roomsView.dart';
import '../entities/Login_View.dart';
import '../entities/Register_View.dart';
import '../list_item/RoomsChat.dart';

class MaterialAPPChat extends StatelessWidget{
   const MaterialAPPChat({super.key});



  @override
  Widget build(BuildContext context) {

    MaterialApp materialAppWeb= MaterialApp(
        initialRoute:'/Login',
        routes: {
          '/Login': (context) => Login_View(),
          '/Register': (context) => Register_View(),
          '/Home': (context) => Home(),
          '/onBoarding': (context) => onBoardingView(),
          '/rooms': (context) => roomView(),
          '/Splash': (context) => SplashView(),
          '/Home2': (context) => Home2(),
          '/RoomsChat': (context) => RoomsChat(),
          '/GridRooms': (context) => RoomChatCrid(),
        }
    );

    MaterialApp materialAppIOS= MaterialApp(

        initialRoute:'/Login',
        routes: {
          '/Login': (context) => Login_View(),
          '/Register': (context) => Register_View(),
          '/Home': (context) => Home(),
          '/onBoarding': (context) => onBoardingView(),
          '/rooms': (context) => roomView(),
          '/Splash': (context) => SplashView(),
          '/Home2': (context) => Home2(),
          '/RoomsChat': (context) => RoomsChat(),
          '/GridRooms': (context) => RoomChatCrid(),
        }
    );

    MaterialApp materialAppAndroid= MaterialApp(
        initialRoute:'/GridRooms',
        routes: {
          '/Login': (context) => Login_View(),
          '/Register': (context) => Register_View(),
          '/Home': (context) => Home(),
          '/onBoarding': (context) => onBoardingView(),
          '/rooms': (context) => roomView(),
          '/Splash': (context) => SplashView(),
          '/Home2': (context) => Home2(),
          '/RoomsChat': (context) => RoomsChat(),
          '/GridRooms': (context) => RoomChatCrid(),
        }
    );


    MaterialApp getMatrialapp(){

      late MaterialApp materialApp;

      if(kIsWeb) {
        materialApp= materialAppWeb;
      }
      switch(defaultTargetPlatform){
        case TargetPlatform.android:
          materialApp= materialAppAndroid;break;
        case TargetPlatform.iOS:
          materialApp= materialAppIOS;break;
      }
      return materialApp;
    }




    // TODO: implement build
    return getMatrialapp();
  }





}