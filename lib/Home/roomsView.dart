import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class roomView extends StatefulWidget{
  @override
  State<roomView> createState() => _roomViewState();
}

class _roomViewState extends State<roomView> {

  final List<String> entries = <String>['room chat DAM1', 'room chat DAM2', 'room chat DAM3'];
  final List<int> colorCodes = <int>[200, 400, 600];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("rooms "),
      ),

      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child:
        ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 60,
              color: Colors.teal[colorCodes[index]],
              child: Center(child: Text('Entry to ${entries[index]}',
                  style: TextStyle(fontWeight: FontWeight.bold))),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),


      ),
    );
  }
}