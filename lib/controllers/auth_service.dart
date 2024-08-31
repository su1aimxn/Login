import 'package:flutter_2/models/user_model.dart';
import 'package:flutter_2/variables.dart';  // Ensure this contains the correct apiURL
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  Future<void> login(String user_name, String password) async {
    final url = Uri.parse("$apiURL/api/auth/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "user_name": user_name,
          "password": password, // Fixed the typo here
        }),
      );

      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        // Handle successful login
        final userData = jsonDecode(response.body);
        
        // Do something with the userData (e.g., store token, navigate to home page, etc.)
      } else {
        // Handle error responses (e.g., 400, 401, 500)
        print('Error: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions (e.g., network errors)
      print('Error: $e');
    }
  }
}
