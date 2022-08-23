import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/colors.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';

Widget profileCard(BuildContext context, String title) {
  return Container(
    height: context.screenHeight() / 15,
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: orangeColor),
    ),
    child: Text(
      title,
      style: const TextStyle(
          color: hintTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          fontSize: 16),
    ),
  );
}

Widget logOut(void Function()? onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: orangeColor,
      ),
      child: const Text(
        'Log Out',
        style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            fontSize: 16),
      ),
    ),
  );
}
