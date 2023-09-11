import 'package:injectable/injectable.dart';
import 'package:training_example/fake_api/service/api_constants.dart';
import 'package:http/http.dart' as http;

@singleton
class ApiService {
  Future<dynamic> fetchUsersData({required int limit, required int skip}) async {
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.userEndpoint}?limit=$limit&skip=$skip'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load users');
    }
  }
}