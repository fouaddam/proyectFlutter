
import 'package:cloud_firestore/cloud_firestore.dart';

class Room2 {
  final String? name;
  final String? photo;
  final int? members;


  Room2({
    this.name,
    this.photo,
    this.members,

  });

  factory Room2.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Room2(
      name: data?['name'],
      photo: data?['image'],
      members: data?['members'],

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (photo != null) "imagen": photo,
      if (members != null) "members": members,

    };
  }
}