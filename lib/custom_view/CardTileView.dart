

import 'package:flutter/material.dart';

class CardTileView extends StatelessWidget{


  CardTileView({super.key, required this.name, required this.photo, required this.index, required this.onShortClick});

  final String name;
  final String photo;
  final Function (int index)onShortClick;
  final int index;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return InkWell(
       onTap: (){
         onShortClick(index);
       },

         child:Container(
            decoration: BoxDecoration(
             image: DecorationImage(
             image: NetworkImage(photo),
           fit: BoxFit.cover
          ),
      ),
           child: Card(
             color: Colors.amber,
             child: Center(child: Text(name)),

           ),
         ),
         );
  }
}