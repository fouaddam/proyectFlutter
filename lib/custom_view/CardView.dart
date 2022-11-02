import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

import '../fb_objects/RoomsPhotoCard.dart';

class CardView extends StatelessWidget{

  final List<Room2> nombre;

  void NaveTo(BuildContext context,int index){
    NavigatorState navigatorState=Navigator.of(context);

    switch(index){
      case 0:navigatorState.pushNamed('/RoomsChat');break;
    }
  }

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
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: (){
                  NaveTo(context,index);
                },
                child: Card(
                  color: Colors.black12,
                  child: Center(child: Text(nombre[index].name!,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                    ),
                  )),

                ),
              ),
            );

          }
      ),
    );
  }




}