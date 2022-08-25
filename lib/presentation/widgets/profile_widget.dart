import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/loginVM.dart';
import 'package:rare_crew_task_cynthia/logic/view_model_provider.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/colors.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/profile_card.dart';

class ProfileWidget extends StatefulHookConsumerWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(profileViewModelNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person,
          color: orangeColor,
          size: context.screenHeight() / 4,
        ),
        FutureBuilder<DocumentSnapshot>(
          future:
              ref.read(profileViewModelNotifierProvider.notifier).getUserDoc(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            //returns a list of user details retrieved from firestore
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profileCard(context, 'Email: ${snapshot.data!['email']}'),
                    profileCard(
                        context, 'Full Name: ${snapshot.data!['fullName']}'),
                    profileCard(context,
                        'Phone Number: ${snapshot.data!['phoneNumber']}')
                  ]);
            }
            if (!snapshot.hasData) {
              return const CircularProgressIndicator(
                color: orangeColor,
              );
            }
            if (snapshot.hasError) {
              return const Text(
                'An error Occurred',
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 16),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Loading.......',
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 16),
              ),
            );
          },
        ),
        Center(
          child: logOut(() {
            ref.read(loginViewModelNotifierProvider.notifier).logOut(context);
          }),
        ),
      ],
    );
  }
}
