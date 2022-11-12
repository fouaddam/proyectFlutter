

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Chat_trail.dart';

class RecieverMessageBubble extends StatelessWidget{

  final String sMessage;

  const RecieverMessageBubble({super.key, required this.sMessage});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 60, top: 0, bottom: 5),
      child: Row(

        children: <Widget>[
          Flexible(child:
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: CustomPaint(painter: Chat_bubble(Colors.cyan[900]!)) ,
              ))
              ,
          Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.cyan[900],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: Text(
                        sMessage,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),


                ],
              )),
        ],
      ),
    );
  }




}