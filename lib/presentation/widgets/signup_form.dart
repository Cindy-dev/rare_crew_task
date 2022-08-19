import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/screens/login_screen.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/custom_buttons.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/navigators.dart';
import '../utils/helpers/text_form.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, context.screenHeight()/26, 24, 24),
      child: Column(
        children: [
          textForm(
            'Full name',
            const Icon(Icons.person, color: hintTextColor),
            _nameController
          ),
          SizedBox(
            height: context.screenHeight() / 50,
          ),
          textForm(
            'Email address',
            const Icon(Icons.email, color: hintTextColor),
            _emailController
          ),
          SizedBox(
            height: context.screenHeight() / 50,
          ),
          textForm(
            'Phone number',
            const Icon(Icons.phone, color: hintTextColor),
            _phoneController
          ),
          SizedBox(
            height: context.screenHeight() / 50,
          ),
          textForm(
            'Password',
            const Icon(Icons.lock, color: hintTextColor),
            _passwordController
          ),
          SizedBox(
            height: context.screenHeight() / 30,
          ),
          authenticationButton(context, 'Sign Up'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
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
                onTap: (){
                  navigatePush(context, const LoginScreen());
                },
                child: const Text(
                  'Log In',
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
