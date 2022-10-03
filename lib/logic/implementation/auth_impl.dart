import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/data/model/user.dart';

abstract class AuthDataManagerImpl {
  Future<AppUser> signUP( String email, String password,
      String phoneNumber, String fullName);

  Future<UserCredential> signIn( String email, String password);
}
