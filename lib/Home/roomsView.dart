import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../fb_objects/Room.dart';

class roomView extends StatefulWidget{
  @override
  State<roomView> createState() => _roomViewState();
}

class _roomViewState extends State<roomView> {

  FirebaseStorage firebaseStorage=FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  List<QueryDocumentSnapshot<Room>> list=[];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   firebaseFirestore.collection('/rooms').withConverter(
        fromFirestore: Room.fromFirestore,
        toFirestore:(Room room, _)=> room.toFirestore())
                              .get().then((value) =>
                           {
                             list=value.docs,
                           });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: const Text("rooms "),
      ),

      body: Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child:
        ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return

                ListTile(
                title: Text(list[index].data().name!,style: const TextStyle(fontWeight: FontWeight.bold,height: 3
                    , fontSize: 18,  color: Colors.pink,
                  decoration: TextDecoration.overline,
                  decorationColor: Colors.teal,
                  decorationStyle: TextDecorationStyle.double,)),
            leading: const Icon(Icons.ad_units),
            );

          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),



      ),
    );
  }
}