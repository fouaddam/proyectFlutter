
import 'package:flutter/foundation.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';
import 'package:proyectoflutter/fb_objects/Room.dart';

class DataHolder{


  static final DataHolder _dataHolder=new DataHolder._iternal();
  Profil profil=new Profil();
  Room roomSelected=new Room();

  DataHolder._iternal(){

  }

  factory DataHolder(){
    return _dataHolder;
  }
  

}