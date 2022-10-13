


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/custom_view/RF_Text.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

import '../custom_view/list_view.dart';
import '../fb_objects/TextChat.dart';

class RoomsChat extends StatefulWidget{




  @override
  State<RoomsChat> createState() => _RoomsChatState();
}

class _RoomsChatState extends State<RoomsChat> {

  final FirebaseFirestore db=FirebaseFirestore.instance;
    List<QueryDocumentSnapshot<ChatText>> listatexts=[];



  void DescargarChats() async {

    //DataHolder().roomSelected.Uid!
    String Path=DataHolder().COLLECTION_ROOMS+DataHolder().roomSelected.Uid!+
        DataHolder().COLLECTION_TEXTS;

    print(DataHolder().roomSelected.Uid!);
    final ref = db.collection(Path).withConverter(
      fromFirestore: ChatText.fromFirestore,
      toFirestore: (ChatText chatText, _) => chatText.toFirestore(),
    );
    final docSnap = await ref.get();


    setState(() {
      listatexts=docSnap.docs;
    });
    print("+++++++++++++++++"+listatexts.toString());

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DescargarChats();
  }

  void listItemShortClick(int index){


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title:  Text(DataHolder().roomSelected.name!),
      ),

      body:
      Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child:Stack(
          children: [
            ListView.separated(

              padding: const EdgeInsets.all(10),
              itemCount: listatexts.length,
              itemBuilder: (BuildContext context, int index) {
                return  RoomItem(name:listatexts[index].data().text!,onClick: listItemShortClick,index: index,);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
            SizedBox(height: 300,),
            RF_Text(),

          ],
        )




      ),

    );
  }
}