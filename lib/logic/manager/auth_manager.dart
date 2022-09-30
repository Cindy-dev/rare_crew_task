import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/data/model/user.dart';
import 'package:rare_crew_task_cynthia/data/repository/authentication.dart';
import '../implementation/auth_impl.dart';

class AuthDataManager extends AuthDataManagerImpl {
  final AuthenticationServices authService;
  AuthDataManager({required this.authService});

  @override
  Future<AppUser> signUP(VoidCallback onSuccess, String email, String password, String phoneNumber, String fullName) {
    // TODO: implement signUP
    throw UnimplementedError();
  }

  @override
  Future<AppUser> signIn(VoidCallback onSuccess, String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}

final authDataManagerProvider = Provider((ref) {
  final authDataManager = ref.watch(authServicesProvider);
  return AuthDataManager(authService: authDataManager);
});