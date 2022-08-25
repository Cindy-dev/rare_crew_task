import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/data/model/user.dart';

class ProfileVM extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Object?>>? getUserDoc() async{
    final doc = await FirebaseFirestore.instance.collection('User').doc(user?.uid).get();
    return doc;
  }

}
