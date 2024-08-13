import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia_test/model/user.dart';

class ApiService {
  final String baseUrl = "https://reqres.in/api/users";

  Future<UserResponse> fetchUsers(int page, int perPage) async {
    final response =
        await http.get(Uri.parse("$baseUrl?page=$page&per_page=$perPage"));

    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load users");
    }
  }
}
