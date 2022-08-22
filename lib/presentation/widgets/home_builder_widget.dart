import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';
import 'package:rare_crew_task_cynthia/presentation/widgets/edit_item_modal_sheet.dart';

import '../../logic/view_model/db_vm.dart';
import '../../logic/view_model_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/grid_tile.dart';

class HomeBuilder extends StatefulHookConsumerWidget {
  TextEditingController name;
  TextEditingController occupation;
  TextEditingController age;
  HomeBuilder(
      {Key? key,
      required this.name,
      required this.occupation,
      required this.age})
      : super(key: key);

  @override
  ConsumerState<HomeBuilder> createState() => _HomeBuilderState();
}


class _HomeBuilderState extends ConsumerState<HomeBuilder> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
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
                      ref.read(dbViewModelNotifierProvider.notifier).getData();
                    });
                  }, update: () {
                    editItemModalSheet(context, widget.name, widget.occupation,
                        widget.age, () {});
                  }),
                );
              }),
        );
      }
      return Container(
          padding: EdgeInsets.only(top: context.screenHeight() / 2.5),
          alignment: Alignment.center,
          child: const Text('An error Occurred'));
    });
  }
}
