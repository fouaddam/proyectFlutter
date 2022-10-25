

import 'package:flutter/material.dart';
import 'package:proyectoflutter/fb_objects/RoomsPhotoCard.dart';
import 'package:proyectoflutter/firebase/FBAdmin.dart';
import '../custom_view/CardTileView.dart';
import '../sigelton/DataHolder.dart';

class RoomChatCrid extends StatefulWidget{
  const RoomChatCrid({super.key});

  @override
  State<RoomChatCrid> createState() => _RoomChatCridState();
}

class _RoomChatCridState extends State<RoomChatCrid> {
  List<Room2>listaRoom2=[];
  FBAdmin fbAdmin= FBAdmin();

  void DescargaPerfiles() async {
    listaRoom2=await fbAdmin.Descargar_Room2();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      DescargaPerfiles();
    });
  }

  void onShortClick(int index){
      DataHolder().room2selected=listaRoom2[index];
      print(index);
     // Navigator.of(context).pushNamed('Chat') 26/10
  }


  @override
  Widget build(BuildContext context) {
    // TOD O: implement build
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: listaRoom2.length,
            itemBuilder: (BuildContext context, int index) {
              return CardTileView(name: listaRoom2[index].name!,photo: listaRoom2[index].photo!,index: index,
                  onShortClick: onShortClick,);
            }
        ),
      ),
    );
  }
}