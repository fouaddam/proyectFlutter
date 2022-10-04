
import 'package:flutter/foundation.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';

class DataHolder{


  static final DataHolder _dataHolder=new DataHolder._iternal();
  Profil profil=new Profil();

  DataHolder._iternal(){

  }

  factory DataHolder(){
    return _dataHolder;
  }
  

}