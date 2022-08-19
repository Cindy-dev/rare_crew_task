import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import 'package:rare_crew_task_cynthia/presentation/widgets/signup_form.dart';

import '../utils/constants/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: context.screenHeight() / 15),
        height: context.screenHeight(),
        color: whiteBackground.withOpacity(.8),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: context.screenHeight() / 18),
              height: context.screenHeight()/6,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('asset/images/rarecrew.png'))),
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  fontSize: 20),
            ),
            const Text(
              'Welcome to Rare Crew',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 14),
            ),
            const SignupForm(),
          ],
        ),
      ),
    );
  }
}
