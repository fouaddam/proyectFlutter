

import 'package:flutter/material.dart';
import 'package:proyectoflutter/custom_view/CardView.dart';

class Home2 extends StatelessWidget{
  List<String>nombre=["fouad","rafa","carol"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body:Center(
        child: CardView(nombre: nombre,),
      ),
    );
  }



}