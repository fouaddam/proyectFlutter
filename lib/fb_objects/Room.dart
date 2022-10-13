

import 'package:cloud_firestore/cloud_firestore.dart';

class Room {

  final String? Uid;
  final String? name;


  Room({
    this.Uid,
    this.name,
      });

  factory Room.fromFirestore(DocumentSnapshot<Map<String,dynamic>>snapshot,SnapshotOptions? options){

    final data=snapshot.data();


    return Room(
      name: data?['name'],
      Uid: snapshot.id
    );

  }


  Map<String,dynamic> toFirestore() {

    return{
      if(name!=null) "name":name,
    };

  }















}