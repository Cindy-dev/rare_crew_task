import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/colors.dart';

gridTile(String name, String occupation, num age) {
  return Column(
    children: [
      Text(
        'Name : $name',
        overflow: TextOverflow.ellipsis,
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
      Container(
        alignment: Alignment.bottomRight,
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      )
    ],
  );
}
