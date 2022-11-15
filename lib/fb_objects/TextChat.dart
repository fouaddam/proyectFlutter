
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatText {
  final String? author;
  final String? text;
  final Timestamp? time;


  ChatText({
    this.author,
    this.text,
    this.time,

  });

  factory ChatText.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return ChatText(
      author: data?['author'],
      text: data?['text'],
      time: data?['time'],

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (author != null) "author": author,
      if (text != null) "text": text,
      if (time != null) "time": time,

    };
  }
}