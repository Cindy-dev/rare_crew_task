import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/loginVM.dart';
import 'package:rare_crew_task_cynthia/logic/view_model_provider.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/colors.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/profile_card.dart';

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginViewModelNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Builder(builder: (BuildContext context) {
            if (viewModel is LoginVMInitial) {
            } else if (viewModel is LoginVMLoading) {
              return const CircularProgressIndicator();
            } else if (viewModel is LoginVMLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: orangeColor,
                    size: context.screenHeight() / 4,
                  ),
                  profileCard(context, viewModel.appUser.fullName.toString()),
                  profileCard(context, viewModel.appUser.email),
                  // profileCard(
                  //     context, viewModel.appUser.phoneNumber),
                ],
              );
            }
            return const Text('An error Occurred');
          }),
        ),
        logOut(() {
          ref.read(loginViewModelNotifierProvider.notifier).logOut(context);
        }),
      ],
    );
  }
}
