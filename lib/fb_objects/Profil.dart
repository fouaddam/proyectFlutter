import 'package:cloud_firestore/cloud_firestore.dart';

class Profil {
  final String? name;
  final String? last_name;
  final int? age;
  final List<String>? friends;
  final List<DocumentReference>? rooms;



  Profil({
    this.name="",
    this.last_name="",
    this.age=0,
    this.friends=const [],
    this.rooms=const[],


  });

  factory Profil.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Profil(
      name: data?['name'],
      last_name: data?['last_name'],
      age: data?['age'],
      friends:
      data?['friends'] is Iterable ? List.from(data?['friends']) : null,

      rooms:
      data?['rooms'] is Iterable ? List.from(data?['rooms']) : null,


    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (last_name != null) "last_name": last_name,
      if (age != null) "age": age,
      if (friends!.isNotEmpty) "friends": friends,
      if (rooms!.isNotEmpty) "rooms": rooms,

    };
  }
}