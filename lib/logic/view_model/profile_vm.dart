import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileVM extends ChangeNotifier {
//  final User currentUser = FirebaseAuth.instance.currentUser!;
  final user = FirebaseAuth.instance.currentUser;

  getUsers(user) {
    return FirebaseFirestore.instance
        .collection('User')
        .doc(user?.uid)
        .snapshots()
        .listen((userData) {
      var myId = userData.data()!['uid'];
      var myUsername = userData.data()!['fullName'];
      var myPhoneNumber = userData.data()!['phoneNumber'];
      print(myPhoneNumber);
      print(myUsername);
    });
  }
}
