

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

class SplashView extends StatefulWidget{
   SplashView({Key? key}):super(key:key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  FirebaseFirestore db = FirebaseFirestore.instance;

  void isLogger() async {
    await Future.delayed(Duration(seconds: 5));
    final UserID=FirebaseAuth.instance.currentUser?.uid;
    if(UserID==null)Navigator.of(context).popAndPushNamed('/Login');

    final docRef = db.collection('/Profiles').doc(UserID).withConverter(
        fromFirestore: Profil.fromFirestore,
        toFirestore: (Profil profil, _) => profil.toFirestore());
        DocumentSnapshot<Profil> docSnap=await docRef.get();

        if(docSnap==null){
          Navigator.of(context).popAndPushNamed('/onBoardingView');
        }else
          {
            Navigator.of(context).popAndPushNamed('/Home');
          }



  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogger();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Text("bienvenido fluter chat"),
        )
    );
  }
}
