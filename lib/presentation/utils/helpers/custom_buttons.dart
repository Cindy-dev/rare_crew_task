import 'package:flutter/cupertino.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';

import '../constants/colors.dart';

Widget authenticationButton(BuildContext context, String text) {
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
