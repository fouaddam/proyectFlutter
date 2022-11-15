

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/Home/SplashView.dart';
import 'package:proyectoflutter/Home/onBoardingView.dart';
import 'package:proyectoflutter/Home/roomsView.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

import 'Card_view/RoomChatCrid.dart';
import 'Home/Home.dart';
import 'Home/Home2.dart';
import 'custom_view/CardView.dart';
import 'list_item/RoomsChat.dart';
import 'entities/Login_View.dart';
import 'entities/Register_View.dart';

class App extends StatefulWidget{

  const App({Key? key}):super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

FirebaseFirestore db=FirebaseFirestore.instance;

    late MaterialApp materialApp;
  @override
  Widget build(BuildContext context) {
    






      materialApp=MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
            fontFamily: 'Georgia'
        ),
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

        },

      );



    // TODO: implement build
    return materialApp;
  }
}



