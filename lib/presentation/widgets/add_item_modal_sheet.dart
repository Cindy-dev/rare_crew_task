import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/add_text_form.dart';

import '../utils/constants/colors.dart';

//modal sheet for the add item logic
addItemModalSheet(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController occupationController,
    TextEditingController ageController,
    void Function()? onPressed
    ) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Text(
                'Add New Item',
                style: TextStyle(
                    color: boldTextColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 20),
              ),
              const SizedBox(height: 15),
              addTextForm('Name', nameController),
              const SizedBox(height: 5),
              addTextForm('Occupation', occupationController),
              const SizedBox(height: 5),
              addTextForm('Age', ageController),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary: orangeColor,
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        );
      });
}