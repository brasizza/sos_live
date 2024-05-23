import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:projeto_sos/src/data/models/user_model.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio _dio;

  UserRepositoryImpl({required Dio dio}) : _dio = dio;
  @override
  Future<UserModel?> login() async {
    final response = await _dio.post('/login');

    if (response.statusCode == 200) {
      return UserModel.fromMap(response.data['result']['user']);
    }

    return null;
  }

  @override
  Future<UserModel?> me({required String sessionToken}) async {
    final response = await _dio.post('/me', data: {'sessionToken': sessionToken});

    if (response.statusCode == 200) {
      if (response.data['result']['success'] ?? false) {
        return UserModel.fromMap(response.data['result']['user']);
      }
    }

    return null;
  }

  @override
  Future<UserModel?> update({required UserModel user}) async {
    final response = await _dio.post('/update', data: user.toMap());
    if (response.statusCode == 200) {
      if (response.data['result']['success'] ?? false) {
        return UserModel.fromMap(response.data['result']['user']);
      }
    }
    return null;
  }
}
