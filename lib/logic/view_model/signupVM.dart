import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/data/repository/authentication.dart';

import '../../data/model/user.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/utils/helpers/custom_buttons.dart';
import '../../presentation/utils/helpers/navigators.dart';
import '../controllers/request_view_model.dart';
import '../manager/auth_manager.dart';

class SignupVMNotifier extends RequestStateNotifier<AppUser> {

  final AuthDataManager _authDataManager;

  SignupVMNotifier(
      Ref ref
      ) : _authDataManager = ref.read(authDataManagerProvider);

  void signUp(String email, String password, String phoneNumber, String fullName ) =>
      makeRequest(() => _authDataManager.signUP(email, password, phoneNumber, fullName));


}

// abstract class SignupVMState {
//   SignupVMState();
// }
//
// class SignupVMInitial extends SignupVMState {
//   SignupVMInitial();
// }
//
// class SignupVMLoading extends SignupVMState {
//   SignupVMLoading();
// }
//
// class SignupVMLoaded extends SignupVMState {
//   AppUser appUser;
//   SignupVMLoaded(this.appUser);
// }
//
// class SignupVMError extends SignupVMState {
//   String error;
//   SignupVMError(this.error);
// }
//
// class SignupVMNotifier extends StateNotifier<SignupVMState> {
//   Ref ref;
//   SignupVMNotifier(this.ref) : super(SignupVMInitial());
//
//   Future<void> signUP(BuildContext context, String email, String password,
//       String phoneNumber, String fullName) async {
//     state = SignupVMLoading();
//     try {
//       final result = await ref.read(authServicesProvider).signUP(
//            email, password, phoneNumber, fullName);
//       state = SignupVMLoaded(result);
//     } catch (error) {
//       showAuthDialog(context, error.toString());
//       state = SignupVMError(error.toString());
//       print(error);
//     }
//   }
// }
