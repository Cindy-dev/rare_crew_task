import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/db_vm.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/loginVM.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/profile_vm.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/signupVM.dart';

final dbViewModelNotifierProvider =
    StateNotifierProvider.autoDispose<DBViewModelNotifier, DBViewModelState>(
        (ref) => DBViewModelNotifier(ref));

final loginViewModelNotifierProvider =
    StateNotifierProvider.autoDispose<LoginVMNotifier, LoginVMState>(
        (ref) => LoginVMNotifier(ref));

final signupViewModelNotifierProvider =
    StateNotifierProvider<SignupVMNotifier, SignupVMState>(
        (ref) => SignupVMNotifier(ref));

final profileViewModelNotifierProvider =
    ChangeNotifierProvider((ref) => ProfileVM());
