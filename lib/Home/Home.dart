

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

import '../fb_objects/Profil.dart';


class Home extends StatefulWidget{




  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseFirestore db=FirebaseFirestore.instance;
   String sNombre="bienvenido a la app";


  void getProfile() async {

    final ref = db.collection("/Profiles").doc(FirebaseAuth.instance.currentUser?.uid).withConverter(
      fromFirestore: Profil.fromFirestore,
      toFirestore: (Profil profil, _) => profil.toFirestore(),
    );
    final docSnap = await ref.get();
     DataHolder().profil= docSnap.data()!; // Convert to City object
    if (DataHolder().profil != null) {
      print(DataHolder().profil);

      setState(() {
        sNombre=DataHolder().profil.name!;
      });
    } else {
      print("No such document.");
    }







  }
  @override
  void initState() {

    super.initState();
    getProfile();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Weloc to home"),
      ),
      body: Container(

        child: Column(
          children: [
            Text(sNombre),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.purple,
                fixedSize:  Size(100, 30),
                shadowColor: Colors.black,
                side: BorderSide(color: Colors.black12, width: 2),
                textStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),

              onPressed: () {
                Navigator.of(context).popAndPushNamed("/Login");
              },
              child: Text("Sing out",style: TextStyle(fontSize: 30)),
            ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.purple,
            fixedSize:  Size(100, 30),
            shadowColor: Colors.black,
            side: BorderSide(color: Colors.black12, width: 2),
            textStyle: TextStyle(
              color: Colors.purple,
            ),
          ),

          onPressed: () {
            Navigator.of(context).popAndPushNamed("/rooms");
          },
          child: Text("rooms chat",style: TextStyle(fontSize: 30)),
        ),
          ],
        ),
      ),
    );
  }
}