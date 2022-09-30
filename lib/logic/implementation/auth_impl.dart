import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/data/model/user.dart';

abstract class AuthDataManagerImpl {
  Future<AppUser> signUP(VoidCallback onSuccess, String email, String password,
      String phoneNumber, String fullName);

  Future<AppUser> signIn(VoidCallback onSuccess, String email, String password);
}
