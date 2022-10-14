
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';
import 'package:proyectoflutter/fb_objects/Room.dart';

import '../firebase/FBAdmin.dart';

class DataHolder{


  static final DataHolder _dataHolder=new DataHolder._iternal();

    String COLLECTION_ROOMS="/rooms/";
    String COLLECTION_TEXTS="/Texts";
    String COLLECTION_PROFILE="/Profiles";

    Profil profil=new Profil();
    Room roomSelected=new Room();

      DataHolder._iternal(){

      }

      factory DataHolder(){
        return _dataHolder;
      }

     void descargarMIPerfil() async {
       profil=  await FBAdmin.Descargar_Perfil(FirebaseAuth.instance.currentUser?.uid) as Profil;
    }
  

}