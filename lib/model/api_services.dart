import 'dart:convert';
import 'package:fleetmasta/model/login_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String apiUrl = 'https://dummyjson.com/auth/login';

  Future<Map<String, dynamic>> login(LoginRequest loginRequest) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to login');
    }
  }
}
