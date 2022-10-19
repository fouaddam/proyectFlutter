
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';
import 'package:proyectoflutter/fb_objects/Room.dart';

import '../fb_objects/RoomsPhotoCard.dart';
import '../fb_objects/TextChat.dart';
import '../firebase/FBAdmin.dart';

class DataHolder{
  static final DataHolder _dataHolder=new DataHolder._iternal();

    String COLLECTION_ROOMS="/rooms/";
    String COLLECTION_TEXTS="/Texts";
    String COLLECTION_PROFILE="/Profiles";
    String? MYUID=FirebaseAuth.instance.currentUser?.uid;


    FBAdmin fbAdmin=new FBAdmin();
    Profil profil=new Profil();
    Room roomSelected=new Room();
    ChatText textChat=new ChatText();
    Room2 room2=new Room2();
    List<Room2>?listaRooms2=[];


          DataHolder._iternal(){

          }

          factory DataHolder(){
            return _dataHolder;
          }

           void descargarMIPerfil() async {
             profil= fbAdmin.Descargar_Perfil(MYUID) as Profil;
          }

          void descargar_rooms2() {
            //listaRooms2= fbAdmin.Descargar_Room2() as List<Room2>;

          }
  

}