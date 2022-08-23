import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/data/model/user.dart';

class AuthenticationServices {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  //Method called to create user with email and password
  Future<AppUser> signUP(VoidCallback onSuccess, String email, String password,
      String phoneNumber, String fullName) async {
    try {
      final newUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (newUser.user != null) {
        var user = AppUser(
            id: newUser.user!.uid,
            email: email,
            fullName: fullName,
            phoneNumber: phoneNumber);
        final authUser = newUser.user;
        await authUser?.updateDisplayName(fullName);
        fireStore.collection('User').add({
          'id': newUser.user?.uid,
          'phoneNumber': phoneNumber,
          'email': email,
          'fullName': fullName,
        });
        onSuccess.call();
        return user;
      } else {
        throw Exception();
      }
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  //login method
  Future<AppUser> signIn(
      VoidCallback onSuccess, String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        var user = AppUser(
            id: result.user!.uid,
            email: result.user!.email.toString(),
            fullName: result.user!.displayName.toString(),
            phoneNumber: result.user!.phoneNumber.toString());
        onSuccess.call();
        return user;
      } else {
        throw Exception();
      }
      //The password is invalid or the user does not have a password.
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  //logout method
  Future<void> signOut(VoidCallback onSuccess) async {
    try {
      await auth.signOut();
      onSuccess.call();
      // Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseException catch (error) {
      print(error);
      // return show dialog(
      //     context: context, text: 'Error', contentText: error.toString());
    }
  }
}

//initializing a provider to make our auth functions accessible in the different statea
final authServicesProvider = Provider((ref) => AuthenticationServices());
