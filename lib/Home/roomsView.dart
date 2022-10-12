import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../fb_objects/Room.dart';

class roomView extends StatefulWidget{
  @override
  State<roomView> createState() => _roomViewState();
}

class _roomViewState extends State<roomView>   {


 final FirebaseStorage firebaseStorage=FirebaseStorage.instance;
 final  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  List<QueryDocumentSnapshot<Room>> lista=[];












  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    getRooms();

  }

  getRooms() async {
    final ref =firebaseFirestore.collection("/rooms").withConverter(
      fromFirestore: Room.fromFirestore,
      toFirestore: (Room room, _) => room.toFirestore(),
    );
    final docSnap = await ref.get();

    setState(() {
      lista=docSnap.docs;
    });
  }






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: const Text("rooms "),
      ),

      body:
              Container(


                decoration: const BoxDecoration(

                  image: DecorationImage(

                    image: AssetImage('assets/Fondo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),



                child:
                ListView.separated(

                  padding: const EdgeInsets.all(10),
                  itemCount: lista.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListView();
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),



              ),

          );

  }
}