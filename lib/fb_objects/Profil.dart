import 'package:cloud_firestore/cloud_firestore.dart';

class Profil {
  final String? name;
  final String? last_name;
  final int? age;


  Profil({
    this.name,
    this.last_name,
    this.age,

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

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (last_name != null) "state": last_name,
      if (age != null) "country": age,

    };
  }
}