

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';

import '../custom_view/RF_Text.dart';
import '../entities/Register_View.dart';

class onBoardingView extends StatefulWidget {
  @override
  State<onBoardingView> createState() => _onBoardingViewState();
}

class _onBoardingViewState extends State<onBoardingView> {

  final RF_Text inputName=RF_Text(label: "name");
  final RF_Text inputlastname=RF_Text(label: "last name ");
  final  RF_Text inputAge=RF_Text(label: "age ");

  FirebaseFirestore DB=FirebaseFirestore.instance;


  void acceptPressed(String name,String lastname,int age) async{
    Profil profil=Profil(name: name,last_name: lastname,age: age );

    DB.collection("/Profiles").doc(FirebaseAuth.instance.currentUser?.uid)
    .set(profil.toFirestore());

    Navigator.of(context).popAndPushNamed('/Home');

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro "),
        elevation: 20,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purpleAccent,Colors.white70],
                begin: Alignment.topLeft,
                end:Alignment.topRight
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {

          }, icon: Icon(Icons.menu),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Fondo2.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                Icon(Icons.save_as_outlined,size: 50,),
                SizedBox(height: 60,),
                inputName,
                SizedBox(height: 20,),
                inputlastname,
                SizedBox(height: 20,),
                inputAge,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(child: FloatingActionButton.extended(
                        backgroundColor: const Color(0xff03dac6),
                        foregroundColor: Colors.black,
                        onPressed: () {

                          acceptPressed(inputName.getText(),inputlastname.getText(),int.parse(inputAge.getText()));


                        },
                        icon: Icon(Icons.account_circle_rounded),
                        label: Text('on Boarding'),
                      )),
                      FloatingActionButton.extended(
                        backgroundColor: const Color(0xff03dac6),
                        foregroundColor: Colors.black,
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed('/Login').then((value) =>
                              print(value.toString()));
                        },
                        icon: Icon(Icons.account_circle_rounded),
                        label: Text('Cancel '),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}


