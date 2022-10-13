


import 'package:flutter/material.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

class RoomsChat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title:Text(DataHolder().roomSelected.name!) ,
      ),
      body: Center(
        child: Text("hola"),
      ),
    );
  }


}