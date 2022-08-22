import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/data/model/db_model.dart';
import 'package:rare_crew_task_cynthia/data/repository/database_services.dart';

abstract class DBViewModelState {
  DBViewModelState();
}

class DBViewModelInitial extends DBViewModelState {
  DBViewModelInitial();
}

class DBViewModelLoading extends DBViewModelState {
  DBViewModelLoading();
}

class DBViewModelLoaded extends DBViewModelState {
  DBModel dbModel;
  DBViewModelLoaded(this.dbModel);
}

class DBViewModelError extends DBViewModelState {
  String error;
  DBViewModelError(this.error);
}

class DBViewModelNotifier extends StateNotifier<DBViewModelState> {
  final Ref ref;
  DBViewModelNotifier(this.ref) : super(DBViewModelInitial());

  Future<void> getData() async {
    state = DBViewModelLoading();
    try {
      final result =
          await ref.read(dbServicesProvider).fetchDbData('rare_crew');
    } catch (error) {
      state = DBViewModelError(error.toString());
    }
  }
}
