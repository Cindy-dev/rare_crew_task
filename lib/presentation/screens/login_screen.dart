import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';

import '../utils/constants/colors.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              margin: EdgeInsets.only(bottom: context.screenHeight() / 12.5),
              height: context.screenHeight()/6,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('asset/images/rarecrew.png'))),
            ),
            const Text(
              'Login ',
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
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
