

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Chat_trail.dart';

class SendMessageBubble extends StatelessWidget{

  final String sMessage;

  const SendMessageBubble({super.key, required this.sMessage});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(right: 60, left: 50, top: 0, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
      Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.cyan[900],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    sMessage,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              CustomPaint(painter: Chat_bubble(Colors.cyan[900]!)),
            ],
          )),
        ],
      ),
    );
  }




}