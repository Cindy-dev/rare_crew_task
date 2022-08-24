import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/helpers/navigators.dart';
import 'package:rare_crew_task_cynthia/presentation/widgets/edit_item_modal_sheet.dart';
import '../../logic/view_model/db_vm.dart';
import '../../logic/view_model_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/grid_tile.dart';

class HomeBuilder extends StatefulHookConsumerWidget {
  final TextEditingController name;
  final TextEditingController occupation;
  final TextEditingController age;
  const HomeBuilder(
      {Key? key,
      required this.name,
      required this.occupation,
      required this.age})
      : super(key: key);

  @override
  ConsumerState<HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends ConsumerState<HomeBuilder> {
  TextEditingController nameController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final viewModel = ref.watch(dbViewModelNotifierProvider);
      if (viewModel is DBViewModelInitial) {
      } else if (viewModel is DBViewModelLoading) {
        return const CircularProgressIndicator();
      } else if (viewModel is DBViewModelLoaded) {
        if (viewModel.dbModel.length <= 0) {
          return Container(
              padding: EdgeInsets.only(top: context.screenHeight() / 2.5),
              alignment: Alignment.center,
              child: const Text('No item Added'));
        }
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
                        viewModel.dbModel[i].age, () {
                      ref
                          .read(dbViewModelNotifierProvider.notifier)
                          .deleteData(viewModel.dbModel[i].id);
                      //update the UI after deleting an item from the database
                      setState(() {
                        ref
                            .read(dbViewModelNotifierProvider.notifier)
                            .getData();
                      });
                    },
                        //the edit modal sheet
                        update: () => _showForm(viewModel.dbModel[i].id)));
              }),
        );
      }
      return Container(
          padding: EdgeInsets.only(top: context.screenHeight() / 2.5),
          alignment: Alignment.center,
          child: const Text('An error Occurred'));
    });
  }

  // This function will be triggered when you want to update an item
  void _showForm(String id) async {
    final existingData =
        ref.watch(dbViewModelNotifierProvider.notifier).findByID(id);
    nameController.text = existingData.name;
    occupationController.text = existingData.occupation;
    ageController.text = existingData.age.toString();
    editItemModalSheet(
        context, nameController, occupationController, ageController, () {
      if (id != null) {
        ref.read(dbViewModelNotifierProvider.notifier).updateData(
            id,
            nameController.text,
            occupationController.text,
            num.parse(ageController.text));
        navigatePop(context);
      }
      //update the UI after updating any data in the database
      setState(() {
        ref.read(dbViewModelNotifierProvider.notifier).getData();
      });
    });
  }
}
