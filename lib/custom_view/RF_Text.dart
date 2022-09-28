import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RF_Text extends StatelessWidget{

  TextEditingController inputController=TextEditingController();
  final String label;
  final String title;


    String getText(){
    return inputController.text;
  }



  RF_Text({Key? key, this.label="",  this.title=""}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
        borderSide:
        BorderSide(width: 3, color: Colors.black12), //<-- SEE HERE
          borderRadius: BorderRadius.circular(30),
      ),

        labelText: label,
        errorText: title,
        border: OutlineInputBorder(),

        suffixIcon: Icon(
          Icons.account_circle_rounded,
        ),
      ),
    );
  }

}