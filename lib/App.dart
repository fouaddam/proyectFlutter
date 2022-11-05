

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/Home/SplashView.dart';
import 'package:proyectoflutter/Home/onBoardingView.dart';
import 'package:proyectoflutter/Home/roomsView.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

import 'Card_view/RoomChatCrid.dart';
import 'Home/Home.dart';
import 'Home/Home2.dart';
import 'MaterialApps/Material.dart';
import 'custom_view/CardView.dart';
import 'firebase_options.dart';
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


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return const MaterialAPPChat();
  }
}



