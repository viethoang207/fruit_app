import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:training_example/fake_api/model/remote_user_response.dart';
import 'package:training_example/fake_api/service/api_service.dart';

import '../model/users.dart';

@singleton
class RemoteUserRepository {
  final ApiService apiService;

  const RemoteUserRepository({
    required this.apiService,
  });

  Future<List<RemoteUser>> getUsers({required int limit, required int skip}) async {
    try {
      var response = await apiService.fetchUsersData(limit: limit, skip: skip);
      final jsonResponse = json.decode(response);
      final fakeUserResponse = RemoteUserResponse.fromJson(jsonResponse);
      List<RemoteUser> users = fakeUserResponse.users ?? [];
      print(users.length);
      return users;
    } catch (e) {
      print(e);
      throw Exception('Can not load users from server: $e');
    }
  }
}