

import 'package:firebase_auth/firebase_auth.dart';

import 'package:proyectoflutter/fb_objects/Profil.dart';
import 'package:proyectoflutter/fb_objects/Room.dart';

import '../fb_objects/RoomsPhotoCard.dart';
import '../fb_objects/TextChat.dart';
import '../platform/platformAdmin.dart';

class DataHolder{
  static final DataHolder _dataHolder = new DataHolder._internal();

    String COLLECTION_ROOMS="/rooms/";
    String COLLECTION_TEXTS="/Texts";
    String COLLECTION_PROFILE="/Profiles";
    String? MYUID=FirebaseAuth.instance.currentUser?.uid;
    final String ROOMSCHAT='/RoomsChat';



    Profil profil=new Profil();
    Room roomSelected=new Room();
    ChatText textChat=new ChatText();
    Room2 room2=new Room2();
    Room2 room2selected=Room2();
    List<Room2>?listaRooms2=[];






  factory DataHolder(){
    return _dataHolder;
  }


  late PlatformAdmin platfomAdmin;

  DataHolder._internal(){
    platfomAdmin=PlatformAdmin();
  }


  

}