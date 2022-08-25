import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';

import '../constants/colors.dart';
import 'navigators.dart';

class AuthenticationButton extends StatelessWidget {
  String text;
  AuthenticationButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(24, 24, 24, 45),
      height: context.screenHeight() / 18,
      width: context.screenHeight() / 2,
      decoration: BoxDecoration(
          color: orangeColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: const TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            fontSize: 18),
      ),
    );
  }
}

showAuthDialog(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'An Error Occurred',
            style: TextStyle(
                color: boldTextColor,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 18),
          ),
          content: Text(
            message,
            style: const TextStyle(
                color: textColor,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 18),
          ),
          actions: [
            ElevatedButton(
                onPressed: () => navigatePop(context),
                style: ElevatedButton.styleFrom(
                  primary: orangeColor,
                ),
                child: const Text(
                  'Okay',
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: 16),
                ))
          ],
        );
      });
}

alertDialog(BuildContext context) {
  return AlertDialog(
    title: const Text(
      'An Error Occurred',
      style: TextStyle(
          color: boldTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          fontSize: 18),
    ),
    content: const Text(
      'Please fill in the correct data',
      style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          fontSize: 18),
    ),
    actions: [
      ElevatedButton(
          onPressed: () => navigatePop(context),
          style: ElevatedButton.styleFrom(
            primary: orangeColor,
          ),
          child: const Text(
            'Okay',
            style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 16),
          ))
    ],
  );
}
