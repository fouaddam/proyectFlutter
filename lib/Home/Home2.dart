

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/custom_view/CardView.dart';
import 'package:proyectoflutter/fb_objects/RoomsPhotoCard.dart';

import '../sigelton/DataHolder.dart';


class Home2 extends StatefulWidget{
  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<Room2>nombre=[];

  FirebaseFirestore db=FirebaseFirestore.instance;

  void Descargar_Room2() async {

    final ref = db.collection('/rooms').withConverter(
      fromFirestore: Room2.fromFirestore,
      toFirestore: (Room2 room2, _) => room2.toFirestore(),
    );
    final docSnap = await ref.get();
    final docs= docSnap.docs;

      for(int i=0;i<docs.length;i++){
        nombre.add(docs[i].data());
        print(nombre.first.photo);
      }
    }

    void actualizarLista() async {
    @override
      setState(){

        }
      }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Descargar_Room2();


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body:Center(
        child: CardView(nombre: nombre),
      ),
    );
  }
}