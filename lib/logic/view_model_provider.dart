import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/add_db.dart';
import 'package:rare_crew_task_cynthia/logic/view_model/db_vm.dart';

final dbViewModelNotifierProvider =
    StateNotifierProvider.autoDispose<DBViewModelNotifier, DBViewModelState>(
        (ref) => DBViewModelNotifier(ref));

final addDBViewModelNotifierProvider = StateNotifierProvider.autoDispose<
    AddDBViewModelNotifier,
    AddDBViewModelState>((ref) => AddDBViewModelNotifier(ref));
