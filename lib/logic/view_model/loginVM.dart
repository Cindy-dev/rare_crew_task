import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/request_view_model.dart';
import '../manager/auth_manager.dart';

class LoginVMNotifier extends RequestStateNotifier<UserCredential> {

   final AuthDataManager _authDataManager;

  LoginVMNotifier(
    Ref ref
  ) : _authDataManager = ref.read(authDataManagerProvider);

  void signIn(String email, String password) =>
      makeRequest(() => _authDataManager.signIn(email, password));


}


final loginViewModelNotifierProvider =
StateNotifierProvider<LoginVMNotifier, RequestState<UserCredential>>(
        (ref) => LoginVMNotifier(ref));
//
// abstract class LoginVMState {
//   LoginVMState();
// }
//
// class LoginVMInitial extends LoginVMState {
//   LoginVMInitial();
// }
//
// class LoginVMLoading extends LoginVMState {
//   LoginVMLoading();
// }
//
// class LoginVMLoaded extends LoginVMState {
//   AppUser appUser;
//   LoginVMLoaded(this.appUser);
// }
//
// class LoginVMError extends LoginVMState {
//   String error;
//   LoginVMError(this.error);
// }
//
// class LoginVMNotifier extends StateNotifier<LoginVMState> {
//   Ref ref;
//   LoginVMNotifier(this.ref) : super(LoginVMInitial());
//   Future<void> login(
//       String email, String password, BuildContext context) async {
//     state = LoginVMLoading();
//     try {
//       final result = await ref.read(authServicesProvider).signIn(() {
//         navigatePush(context, const MainScreen());
//       }, email, password);
//       state = LoginVMLoaded(result);
//     } catch (error) {
//       showAuthDialog(context, error.toString());
//       state = LoginVMError(error.toString());
//       print(error);
//     }
//   }
//
//   Future<void> logOut(BuildContext context) async {
//     try {
//       await ref.read(authServicesProvider).signOut(() {
//         navigatePush(context, const LoginScreen());
//       });
//     } catch (error) {
//       print(error.toString());
//     }
//   }
// }
