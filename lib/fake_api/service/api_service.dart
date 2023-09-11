import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:training_example/fake_api/service/api_constants.dart';
import 'package:http/http.dart' as http;

@singleton
class ApiService {

  Future<dynamic> executeGET({required String endpoint, Map<String, dynamic>? params}) async {
    var uri = Uri.https(ApiConstants.baseUrl, endpoint, params);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<dynamic> fetchUsersData({required int limit, required int skip}) async {
    print('load users: limit: $limit - skip: $skip');
    var endpoint = ApiConstants.userEndpoint;
    var queryParameters = {
      'limit': '$limit',
      'skip': '$skip',
    };
    var rs = await executeGET(endpoint: endpoint, params: queryParameters) as String;
    return rs;
  }
}
