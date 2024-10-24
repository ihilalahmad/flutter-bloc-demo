import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc_demo/utils/config.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<String> loginUser(String email, String password) async {
    try {
      if (email == '' || password == '') {
        return 'Email or Password must not be empty';
      } else {
        Map loginPayload = {"email": email, "password": password};

        final response =
            await http.post(Uri.parse(Config.loginUrl), body: loginPayload);
        var data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          return 'Login Successful';
        }else if(response.statusCode == 400){
          return data['error'];
        } else {
          return 'Something went wrong';
        }
      }
    } on SocketException {
      throw Exception('No internet connection');
    } on TimeoutException {
      throw Exception('Connection timeout error');
    }
  }
}
