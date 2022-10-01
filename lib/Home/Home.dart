

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget{




  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseFirestore db=FirebaseFirestore.instance;
   String nombre="bien venido a la app";

  void getProfile() async {

    final docs=db.collection("/Profiles").doc(FirebaseAuth.instance.currentUser?.uid);

    await docs.get().then((DocumentSnapshot doc) {
      final data=doc.data() as Map<String,dynamic>;
      Fluttertoast.showToast(
          msg: "This is a Toast message",  // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER,    // location
          timeInSecForIosWeb: 4              // duration
      );
      setState(() {
        nombre=data?['name'];
      });
      onError: (e) => print("Error getting document: $e");
    }

    );



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
            Text(nombre),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.purple,
                fixedSize:  Size(450, 50),
                shadowColor: Colors.black,
                side: BorderSide(color: Colors.black12, width: 2),
                textStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),

              onPressed: () {
                Navigator.of(context).popAndPushNamed("/Login");
              },
              child: Text("Sing In",style: TextStyle(fontSize: 30)),

            ),

          ],
        ),
      ),
    );
  }
}