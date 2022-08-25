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
    final user = FirebaseAuth.instance.currentUser;
    final viewModel = ref.watch(profileViewModelNotifierProvider);
    final collectionRef = FirebaseFirestore.instance.collection('User');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: orangeColor,
              size: context.screenHeight() / 4,
            ),

            Container(
              height: 500,
              child: FutureBuilder<DocumentSnapshot>(
                future: collectionRef.doc(user?.uid).get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  Map<String, dynamic>? futureData =
                      snapshot.data?.data() as Map<String, dynamic>;
                  print('work${user?.uid}');
                  print('helllo' + collectionRef.doc(user?.uid).toString());
                  // if (snapshot.connectionState == ConnectionState.done) {
                  //   return profileCard(
                  //       context, futureData['phoneNumber'] ?? '');
                  // }
                  return const CircularProgressIndicator();
                },
              ),
            ),

            //profileCard(context, viewModel.userData['email'] ?? '' ),
            // profileCard(context, viewModel.appUser.email),
            //  profileCard(context, viewModel.appUser.phoneNumber),
          ],
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
