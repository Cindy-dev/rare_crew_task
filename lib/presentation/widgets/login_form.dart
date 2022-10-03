import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/controllers/request_view_model.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/loginVM.dart';
import 'package:rare_crew_task_cynthia/logic/view_model_provider.dart';
import 'package:rare_crew_task_cynthia/presentation/screens/main_screen.dart';
import 'package:rare_crew_task_cynthia/presentation/screens/signup_screen.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/custom_buttons.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/navigators.dart';
import '../../data/repository/authentication.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/text_form.dart';

class LoginForm extends StatefulHookConsumerWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(loginViewModelNotifierProvider);
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 44, 24, 24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                textForm(
                    'email',
                    const Icon(Icons.person, color: hintTextColor),
                    _emailController, (String? value) {
                  if (value!.isEmpty) {
                    return 'email is required';
                  }
                  if (!RegExp(
                          "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                      .hasMatch(value)) {
                    return 'Please input a valid email address';
                  } else {
                    return null;
                  }
                }),
                const SizedBox(
                  height: 24,
                ),
                textForm(
                  'Password',
                  const Icon(
                    Icons.lock,
                    color: hintTextColor,
                  ),
                  _passwordController,
                  (password) {
                    Pattern pattern =
                        r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
                    RegExp regex = RegExp(pattern.toString());
                    if (!regex.hasMatch(password!)) {
                      return 'Password should be 6 characters including\nlowercase and uppercase letters and at\nleast a symbol';
                    } else {
                      return null;
                    }
                  },
                ),
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
                Consumer(builder: (context, ref, child) {
                  final result = ref.watch(loginViewModelNotifierProvider);
                  ref.listen<RequestState>(
                      loginViewModelNotifierProvider, (previous, state) {
                        if(state is Success){
                          navigatePush(context, const SignupScreen());
                        }
                  });
                  if (result is Loading) {
                    return const CircularProgressIndicator(
                      color: orangeColor,
                    );
                  } else {
                    return GestureDetector(
                        onTap: () {
                          if (!formKey.currentState!.validate()) {
                            // Invalid!
                            return;
                          }
                          ref
                              .read(loginViewModelNotifierProvider.notifier)
                              .signIn(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                        child: AuthenticationButton('Login'));
                  }
                }),
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
          ),
        ),
      ),
    );
  }
}
