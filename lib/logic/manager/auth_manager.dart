import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/data/model/user.dart';
import 'package:rare_crew_task_cynthia/data/repository/authentication.dart';
import '../implementation/auth_impl.dart';

class AuthDataManager extends AuthDataManagerImpl {
  final AuthenticationServices authService;
  AuthDataManager({required this.authService});

  @override
  Future<AppUser> signUP(String email, String password, String phoneNumber,
          String fullName) async =>
      await authService.signUP(email, password, phoneNumber, fullName);

  @override
  Future<UserCredential> signIn(String email, String password) async =>
      await authService.signIn(email, password);
}
final authDataManagerProvider = Provider((ref) {
  final authDataManager = ref.watch(authServicesProvider);
  return AuthDataManager(authService: authDataManager);
});
