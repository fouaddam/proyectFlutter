


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformAdmin {

      late double dSCREEN_WIDTH;
      late double dSCREEN_HEIGTH;
      late BuildContext context;


      PlatformAdmin();

      void initDisplayData(BuildContext context){
        dSCREEN_HEIGTH=MediaQuery.of(context).size.height;
        dSCREEN_WIDTH=MediaQuery.of(context).size.width;
      }

  bool isPlataformAndroid(){
        return defaultTargetPlatform==TargetPlatform.android;
      }

      bool isIosPlataform(){
        return defaultTargetPlatform==TargetPlatform.iOS;
      }

      bool isWebPlataform(){
        return defaultTargetPlatform!=TargetPlatform.android && defaultTargetPlatform!=TargetPlatform.iOS;
      }







}