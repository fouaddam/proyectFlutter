


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
       RF_Text inputText= RF_Text();

  final String Path=DataHolder().COLLECTION_ROOMS+DataHolder().roomSelected.Uid!+
           DataHolder().COLLECTION_TEXTS;


  void PressedPressed(){
    final docRef = db.collection(Path);
    ChatText textChat= ChatText(text:inputText.getText(),author: DataHolder().profil.id,time: Timestamp.now());
    docRef.add(textChat.toFirestore());

  }

  void DescargarChats() async {

    final docRef = db.collection(Path).withConverter(
      fromFirestore: ChatText.fromFirestore,
      toFirestore: (ChatText chatText, _) => chatText.toFirestore(),
    );

    docRef.snapshots().listen(
          (event) =>
              setState(()  {
                listatexts.clear();
                listatexts= event.docs;
              }
              ),
      onError: (error) =>
                print("Listen failed: $error"
          ),
    );

    /*final docSnap = await ref.get();


    setState(() {
          listatexts=docSnap.docs;
      });
    print("+++++++++++++++++"+listatexts.toString());*/

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      DescargarChats();
    });



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

            inputText,
            FloatingActionButton.extended(
              onPressed: PressedPressed,
                  label: const Text('Send'),
                  icon: const Icon(Icons.thumb_up),
              backgroundColor: Colors.pink,
            ),


          ],
        )




      ),

    );
  }
}