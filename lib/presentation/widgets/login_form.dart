import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/screens/main_screen.dart';
import 'package:rare_crew_task_cynthia/presentation/screens/signup_screen.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/custom_buttons.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/navigators.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/text_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 44, 24, 24),
      child: Column(
        children: [
          textForm('Username', const Icon(Icons.person, color: hintTextColor),
              _emailController),
          const SizedBox(
            height: 24,
          ),
          textForm(
              'Password',
              const Icon(
                Icons.lock,
                color: hintTextColor,
              ),
              _passwordController),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Forgot Password?',
            style: TextStyle(
                color: boldTextColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontSize: 14),
          ),
          GestureDetector(
              onTap: () => navigatePush(context, const MainScreen()),
              child: authenticationButton(context, 'Login')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Don’t have an account?',
                style: TextStyle(
                    color: boldTextColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  navigatePush(context, const SignupScreen());
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: orangeColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 14),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
