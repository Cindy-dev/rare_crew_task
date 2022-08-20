import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/colors.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 50, right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: orangeColor),
            )),
        Expanded(
          child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: context.screenHeight() / 2,
                width: context.screenHeight() / 2,
                decoration: BoxDecoration(
                    border: Border.all(color: orangeColor),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
