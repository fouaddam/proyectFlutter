import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget{

  final List<String> nombre;

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
            return Card(
              color: Colors.black12,
              child: Center(child: Text(nombre[index],
              style: TextStyle(
                fontSize: 25,
                color: Colors.orange,

              ),
              )),


            );

          }
      ),
    );
  }




}