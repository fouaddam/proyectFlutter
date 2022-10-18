import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fb_objects/RoomsPhotoCard.dart';

class CardView extends StatelessWidget{

  final List<Room2> nombre;

  const CardView({super.key, required this.nombre});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: nombre.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
            image: NetworkImage(nombre[index].photo!),
            fit:BoxFit.cover
            ),
                ),
              child: Card(
                color: Colors.black12,
                child: Center(child: Text(nombre[index].name!,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,

                ),
                )),

              ),
            );

          }
      ),
    );
  }




}