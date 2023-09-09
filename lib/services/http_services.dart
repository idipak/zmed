
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/task_list_model.dart';
import 'package:todo/models/user_model.dart';

final dioProvider = Provider<DioClient>((ref) => DioClient());

class DioClient{

  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://d473b897-ef30-4a6b-bbde-58e8ef1a8bd2.mock.pstmn.io',
      headers: {'x-api-key': 'PMAK-64e049c4d121ee0385371797-67c3bd59a0969e5b55d27e83aabcd22a6f'}
    )
  );
  
  
  Future<UserModel> getUser()async{
    final response = await _dio.get('/user/info');
    return UserModel.fromJson(jsonDecode(response.data));
    // return UserModel();
  }

  Future<TaskListModel> getTasks()async{
    final response = await _dio.get('/list/tasks');
    return TaskListModel.fromJson(jsonDecode(response.data));
  }

}