import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/db_vm.dart';
import 'package:rare_crew_task_cynthia/logic/view_model_provider.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/colors.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/custom_buttons.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/grid_tile.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/navigators.dart';
import 'package:rare_crew_task_cynthia/presentation/widgets/add_item_modal_sheet.dart';
import 'package:rare_crew_task_cynthia/presentation/widgets/home_builder_widget.dart';

class HomeWidget extends StatefulHookConsumerWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(dbViewModelNotifierProvider.notifier).getData();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(dbViewModelNotifierProvider);
    return Column(
      children: [
        //add icon that opens the modal sheet
        Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 50, right: 10),
            child: IconButton(
              onPressed: () async {
                await addItemModalSheet(context, nameController,
                    occupationController, ageController, () {
                  //To check if the text field is empty and throw and throw an alert dialog
                  if (nameController.text.isEmpty ||
                      occupationController.text.isEmpty ||
                      ageController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return alertDialog(context);
                        });
                    alertDialog(context);
                  } else {
                    //if all controllers have data then add it to the database
                    ref.read(dbViewModelNotifierProvider.notifier).addData(
                        nameController.text,
                        occupationController.text,
                        num.parse(ageController.text));
                    // clearing the text field after successfully adding data to the database
                    nameController.clear();
                    occupationController.clear();
                    ageController.clear();
                    navigatePop(context);
                  }
                });
                //update the UI after adding a new data to the database
                setState(() {
                  ref.read(dbViewModelNotifierProvider.notifier).getData();
                });
              },
              icon: const Icon(Icons.add, color: orangeColor),
            )),
        HomeBuilder(
          name: nameController,
          occupation: occupationController,
          age: ageController,
        )
      ],
    );
  }
}
