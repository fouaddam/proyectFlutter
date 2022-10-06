import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';

import '../custom_view/RF_Text.dart';

class Login_View extends StatefulWidget{


  Login_View({Key? key}):super(key: key);
  @override
  State<Login_View> createState() => _Login_ViewState();
}

class _Login_ViewState extends State<Login_View> {

         RF_Text inputEmail=  RF_Text(label: "Email",);
         RF_Text inputPassword=RF_Text(label: "Password",isActive: true);

         Login(BuildContext context) async {
           try {
             final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                 email: inputEmail.getText(),
                 password: inputPassword.getText()

             );
             final UserId=FirebaseAuth.instance.currentUser?.uid;
                if(UserId!=null){
                 final doc =FirebaseFirestore.instance.collection('/Profiles').doc(UserId).withConverter(
                      fromFirestore: Profil.fromFirestore, toFirestore: (Profil profil, _) => profil.toFirestore());
                    final docRef=await doc.get();
                    if(docRef.exists) {
                      Navigator.of(context).popAndPushNamed('/Home');
                    }else{
                      Navigator.of(context).popAndPushNamed('/onBoarding');
                    }
                }

           } on FirebaseAuthException catch (e) {
             if (e.code == 'user-not-found') {
               print('No user found for that email.');
               Navigator.of(context).popAndPushNamed("/Register");
             } else if (e.code == 'wrong-password') {
               print('Wrong password provided for that user.');
             }
           }

         }



  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Application "),
        elevation: 20,
        backgroundColor: Colors.purple,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purpleAccent,Colors.white70],
                begin: Alignment.bottomRight,
                end:Alignment.topLeft
            ),
          ),
        ),

      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Fondo.jpg'),
                fit: BoxFit.cover,
            ),
        ),

    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
           children: [
                        SizedBox(height: 20,),
                        Icon(Icons.android,
                          size: 100,),
                        Text(
                          'Hello again',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(height: 20,),
                        inputEmail,
                        SizedBox(height: 20,),
                        inputPassword,
                        SizedBox(height: 10,),
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
                            Login(context);
                          },
                          child: Text("Sing In",style: TextStyle(fontSize: 30)),

                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Not a member ? "),
                            ),
                            TextButton(
                              onPressed: () {
                               Navigator.of(context).popAndPushNamed('/Register');
                              },
                              child: Text("Register Now"),
                            )
                          ],
                        )
                      ],
                    ),
    ),
                ),

              );


  }
}