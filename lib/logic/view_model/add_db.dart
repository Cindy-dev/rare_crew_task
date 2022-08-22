import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew_task_cynthia/data/model/db_model.dart';
import 'package:rare_crew_task_cynthia/data/repository/database_services.dart';

abstract class AddDBViewModelState {
  AddDBViewModelState();
}

class AddDBViewModelInitial extends AddDBViewModelState {
  AddDBViewModelInitial();
}

class AddDBViewModelLoading extends AddDBViewModelState {
  AddDBViewModelLoading();
}

class AddDBViewModelLoaded extends AddDBViewModelState {
  DBModel dbModel;
  AddDBViewModelLoaded(this.dbModel);
}

class AddDBViewModelError extends AddDBViewModelState {
  String error;
  AddDBViewModelError(this.error);
}

class AddDBViewModelNotifier extends StateNotifier<AddDBViewModelState> {
  final Ref ref;
  AddDBViewModelNotifier(this.ref) : super(AddDBViewModelInitial());

  Future<void> addData(String name, String occupation, num age) async {
    List<DBModel> _items = [];

    state = AddDBViewModelLoading();
    try {
      final newData = DBModel(
          id: DateTime.now().toString(),
          name: name,
          occupation: occupation,
          age: age);
      _items.add(newData);
      //adding the created data to the database
      final result = await ref.read(dbServicesProvider).addItem('rare_crew', {
        'id': newData.id,
        'name': newData.name,
        'occupation': newData.occupation,
        'age': newData.age,
      });

      state = AddDBViewModelLoaded(newData);
    } catch (error) {
      print(error);
      state = AddDBViewModelError(error.toString());
    }
  }
}
