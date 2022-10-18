
import 'package:cloud_firestore/cloud_firestore.dart';

class Room2 {
  final String? name;
  final String? photo;


  Room2({
    this.name,
    this.photo,

  });

  factory Room2.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Room2(
      name: data?['name'],
      photo: data?['image'],

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (photo != null) "imagen": photo,

    };
  }
}