import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/db_vm.dart';
import 'package:rare_crew_task_cynthia/logic/view_model_provider.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/colors.dart';
import 'package:rare_crew_task_cynthia/presentation/utils/constants/device_size.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dbViewModelNotifierProvider);
    return Column(
      children: [
        Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 50, right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: orangeColor),
            )),
        Builder(builder: (context) {
          if (viewModel is DBViewModelInitial) {
          } else if (viewModel is DBViewModelLoading) {
            return const CircularProgressIndicator();
          } else if (viewModel is DBViewModelLoaded) {
            return Expanded(
              child: GridView.builder(
                  itemCount: viewModel.dbModel.id.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: context.screenHeight() / 2,
                      width: context.screenHeight() / 2,
                      decoration: BoxDecoration(
                          border: Border.all(color: orangeColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(viewModel.dbModel.name),
                    );
                  }),
            );
          }

          return const Center(child: Text('No item Added'));
        }),
      ],
    );
  }
}
