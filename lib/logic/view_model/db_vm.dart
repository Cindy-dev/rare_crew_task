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
  List<DBModel> dbModel;
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
    List<DBModel> _items = [];

    state = DBViewModelLoading();
    try {
      final result =
          await ref.read(dbServicesProvider).fetchDbData('rare_crew');
      _items = result
          .map((item) => DBModel(
              id: item['id'],
              name: item['name'],
              occupation: item['occupation'],
              age: item['age']))
          .toList();
      state = DBViewModelLoaded(_items);
    } catch (error) {
      print(error);
      state = DBViewModelError(error.toString());
    }
  }
}
