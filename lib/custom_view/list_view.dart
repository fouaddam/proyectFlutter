


import 'package:flutter/material.dart';

class ListView extends StatefulWidget{
  @override
  State<ListView> createState() => _ListViewState();
}

class _ListViewState extends State<ListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const ListTile(

      title: Text("text",style:
      TextStyle(fontWeight: FontWeight.bold,height: 3
        , fontSize: 18,  color: Colors.pink,
        decoration: TextDecoration.overline,
        decorationColor: Colors.teal,
        decorationStyle: TextDecorationStyle.double,)),
      leading: Icon(Icons.ad_units),
    );;
  }
}