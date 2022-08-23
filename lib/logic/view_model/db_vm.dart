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
  List<DBModel> _items = [];

  var editedItem =
      DBModel(id: '', name: '', occupation: '', age: 0);
  final Ref ref;
  DBViewModelNotifier(this.ref) : super(DBViewModelInitial());

  //creating a method to fetch data from our db services
  Future<void> getData() async {
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
      print(error.toString());
      state = DBViewModelError(error.toString());
    }
  }

  Future<void> addData(String name, String occupation, num age) async {
    final newData = DBModel(
        id: DateTime.now().toString(),
        name: name,
        occupation: occupation,
        age: age);
    _items.add(newData);
    //adding the created data to the database
    await ref.read(dbServicesProvider).addItem('rare_crew', {
      'id': newData.id,
      'name': newData.name,
      'occupation': newData.occupation,
      'age': newData.age,
    });
  }

  Future<void> updateData(String id, DBModel dbModel) async {
    final newData = DBModel(
        id: DateTime.now().toString(),
        name: dbModel.name,
        occupation: dbModel.occupation,
        age: dbModel.age);
    ref.read(dbServicesProvider).updateDB(dbModel);
  }

  Future<void> deleteData(String id) async {
    await ref.read(dbServicesProvider).delete(id);
  }

  DBModel findByID(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
