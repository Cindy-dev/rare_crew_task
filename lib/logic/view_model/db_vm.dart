import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/data/model/db_model.dart';

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

class DBViewModel extends DBViewModelState {
  String error;
  DBViewModel(this.error);
}

class DBViewModelNotifier extends StateNotifier<DBViewModelState> {
  DBViewModelNotifier() : super(DBViewModelInitial());
}
