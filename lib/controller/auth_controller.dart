import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:information_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:information_app/provider/user_provider.dart';
import 'package:information_app/varibles.dart';

class AuthSurvice {
  //LoginPage
  Future<UserModel?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiURI/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    }else {
      print('Login Fales : ${response.body}');
       return null;
    }
  }

  //RegisterPage
  Future<void> register(
    String name, String surname,String email, String username, String password, String role) async {
      final response = await http.post(
         Uri.parse("$apiURI/api/auth/register"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'surname': surname,
          'email': email,
          'username': username,
          'password': password,
          'role': role
        }),
      );
      print(response.statusCode);
    }

    //refresh
    Future<void> refreshToken(UserProvider userProvider) async {
      final refreshToken = userProvider.refreshToken;

      if (refreshToken == null) {
        throw Exception('Refresh token is null');
      }

      final response = await http.post(
        Uri.parse('$apiURI/api/auth/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'token': refreshToken,
        }),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        userProvider.requestToken(responseData['accessToken']);
      } else {
        print('Failed to refresh token : ${response.body}');
      throw Exception('Failed to refresh token : ${response.body}');
      }
    }
}