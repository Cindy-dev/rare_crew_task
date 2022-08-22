import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/colors.dart';

// widget to display available data in the database
gridTile(String name, String occupation, num age, void Function()? onPressed,
    {void Function()? update}) {
  return Column(
    children: [
      Text(
        'Name : $name',
        style: const TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            fontSize: 16),
      ),
      const SizedBox(height: 10),
      FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              occupation,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 18),
            ),
            const SizedBox(width: 10),
            Text(
              '| Age : $age',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 15),
            ),
          ],
        ),
      ),
      const Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: update,
            style: ElevatedButton.styleFrom(
              primary: orangeColor,
            ),
            child: const Text(
              'Edit',
              style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  fontSize: 16),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ),
        ],
      )
    ],
  );
}
