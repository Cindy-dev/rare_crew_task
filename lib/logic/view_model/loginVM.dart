import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/data/repository/authentication.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/custom_buttons.dart';

import '../../data/model/user.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/main_screen.dart';
import '../../presentation/utils/helpers/navigators.dart';

abstract class LoginVMState {
  LoginVMState();
}

class LoginVMInitial extends LoginVMState {
  LoginVMInitial();
}

class LoginVMLoading extends LoginVMState {
  LoginVMLoading();
}

class LoginVMLoaded extends LoginVMState {
  AppUser appUser;
  LoginVMLoaded(this.appUser);
}

class LoginVMError extends LoginVMState {
  String error;
  LoginVMError(this.error);
}

class LoginVMNotifier extends StateNotifier<LoginVMState> {
  Ref ref;
  LoginVMNotifier(this.ref) : super(LoginVMInitial());
  Future<void> login(
      String email, String password, BuildContext context) async {
    state = LoginVMLoading();
    try {
      final result = await ref.read(authServicesProvider).signIn(() {
        navigatePush(context, const MainScreen());
      }, email, password);
      state = LoginVMLoaded(result);
    } catch (error) {
      showAuthDialog(context, error.toString());
      state = LoginVMError(error.toString());
      print(error);
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await ref.read(authServicesProvider).signOut(() {
        navigatePush(context, const LoginScreen());
      });
    } catch (error) {
      print(error.toString());
    }
  }
}
