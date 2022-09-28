

import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/custom_view/RF_Text.dart';

import '../custom_view/RF_Text.dart';
import '../custom_view/RF_Text.dart';

class Register_View extends StatefulWidget{
  @override
  State<Register_View> createState() => _Register_ViewState();
}

class _Register_ViewState extends State<Register_View> {


 final RF_Text inputEmail=RF_Text(label: "Email");
 final RF_Text inputPassword=RF_Text(label: "Pasword ");
 final  RF_Text inputRipPassword=RF_Text(label: "Repite Pasword ");


  void Verification(String password) async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: inputEmail.getText(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }


  }



  @override
  Widget build(BuildContext context) {

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
                inputEmail,
                SizedBox(height: 20,),
                inputPassword,
                SizedBox(height: 20,),
                inputRipPassword,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(child: FloatingActionButton.extended(
                        backgroundColor: const Color(0xff03dac6),
                        foregroundColor: Colors.black,
                        onPressed: () {
                          print(inputPassword.getText());
                          print(inputEmail.getText());
                         if(inputPassword.getText()!=inputRipPassword.getText()){
                           return;
                         }else{
                           Verification(inputPassword.getText());
                         }
                        },
                        icon: Icon(Icons.account_circle_rounded),
                        label: Text('Register'),
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