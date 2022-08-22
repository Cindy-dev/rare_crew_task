import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/db_vm.dart';
import 'package:rare_crew_task_cynthia/logic/view_model_provider.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/colors.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/grid_tile.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/navigators.dart';
import 'package:rare_crew_task_cynthia/presentation/widgets/add_item_modal_sheet.dart';

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
        Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 50, right: 10),
            child: IconButton(
              onPressed: () {
                addItemModalSheet(context, nameController, occupationController,
                    ageController, () {
                  ref.read(addDBViewModelNotifierProvider.notifier).addData(
                      nameController.text,
                      occupationController.text,
                      num.parse(ageController.text));
                  navigatePop(context);
                });
              },
              icon: const Icon(Icons.add, color: orangeColor),
            )),
        Builder(builder: (context) {
          if (viewModel is DBViewModelInitial) {
          } else if (viewModel is DBViewModelLoading) {
            return const CircularProgressIndicator();
          } else if (viewModel is DBViewModelLoaded) {
            return Expanded(
              child: GridView.builder(
                  itemCount: viewModel.dbModel.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, i) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      height: context.screenHeight() / 2,
                      width: context.screenHeight() / 2,
                      decoration: BoxDecoration(
                          border: Border.all(color: orangeColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: gridTile(
                          viewModel.dbModel[i].name,
                          viewModel.dbModel[i].occupation,
                          viewModel.dbModel[i].age),
                    );
                  }),
            );
          }

          return Container(
              padding: EdgeInsets.only(top: context.screenHeight() / 2.5),
              alignment: Alignment.center,
              child: const Text('No item Added'));
        }),
      ],
    );
  }
}
