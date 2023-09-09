
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/task_list_model.dart';
import 'package:todo/models/user_model.dart';

import '../services/http_services.dart';

final dataProvider = StateNotifierProvider<DataController, DataBaseState>((ref) {
  final client = ref.watch(dioProvider);
  return DataController(client);
});

class DataController extends StateNotifier<DataBaseState>{
  final DioClient _client;
  DataController(this._client):super(DataLoading()){
    init();
  }

  init()async{
    try{
      state = DataLoading();
      final user = await _client.getUser();
      final tasks = await _client.getTasks();
      state = DataLoaded(user, tasks);
    }catch(e){
      state = DataError(e.toString());
    }

  }

}

abstract class DataBaseState{}

class DataLoading extends DataBaseState{}

class DataLoaded extends DataBaseState{
  final UserModel user;
  final TaskListModel task;
  DataLoaded(this.user, this.task);
}

class DataError extends DataBaseState{
  final String msg;
  DataError(this.msg);
}