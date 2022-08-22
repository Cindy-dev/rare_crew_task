import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/db_vm.dart';

final dbViewModelNotifierProvider =
    StateNotifierProvider.autoDispose<DBViewModelNotifier, DBViewModelState>(
        (ref) => DBViewModelNotifier(ref));
