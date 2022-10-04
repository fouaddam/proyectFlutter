import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class roomView extends StatefulWidget{
  @override
  State<roomView> createState() => _roomViewState();
}

class _roomViewState extends State<roomView> {

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("rooms "),
      ),

      body: Center(
        child:

      ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),
      ),
    );
  }
}