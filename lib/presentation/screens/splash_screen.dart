import 'dart:async';
import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/screens/login_screen.dart';
import 'package:rare_crew_task_cynthia/presentation/screens/main_screen.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/navigators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser == null) {
        // user not logged ==> Login Screen
        navigatePush(context, const LoginScreen());
      } else {
        // user already logged in ==> Home Screen
        navigatePush(context, const MainScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.screenHeight(),
        color: orangeColor.withOpacity(0.9),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, child) {
            return Transform.rotate(
              angle: _animationController.value + 2 + math.pi,
              child: child,
            );
          },
          child: Center(
            child: Hero(
                tag: 'rare', child: Image.asset('asset/images/rarecrew.png')),
          ),
        ),
      ),
    );
  }
  //disposing the controller to avoid leaks
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
