import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skillmaestro/constants/error_handling.dart';
import 'package:skillmaestro/constants/utils.dart';
//import 'package:skillmaestro/models/user.dart';
import 'dart:convert';

class SignUpRepo {
  Future<String> signup(
    String username,
    String email,
    String password,
    String mobile,
  ) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    try {
      //User user = User(username, email, password, mobile);
      http.Response response =
          await http.post(Uri.parse('http://10.0.2.2:8000/signup'),
              body: json.encode({
                "username": 'username',
                "email": 'email',
                "password": 'password',
                "mobile": '123'
              }),
              headers: {'Content-Type': 'application/json'});
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map user = json.decode(response.body);
        print(user['data']);
        //insertedId=user['data']['insertedId'] as String;
        //print(insertedId);
        //return "1";
      }
      return response.body;
    } catch (e) {
      print(e);
      return "network error";
    }
  }

  final dio = Dio();
  Future<void> signUpUser({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
    required String mobile,
  }) async {
    try {
      String path = 'http://10.0.12.48:4000/signup';
      Response res = await dio.post(path, data: {
        "username": username,
        "email": email,
        "password": password,
        "mobile": mobile
      });
      // ignore: use_build_context_synchronously
      DioErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created !..Login with the same credentials');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // void signUpUser({
  //   required String username,
  //   required String email,
  //   required String password,
  //   required String mobile,
  // }) async {
  //   try {
  //     User user = User(username, email, password, mobile);
  //     print(email);

  //     /*  http.Response res =
  //         await http.get(Uri.parse('http://10.0.2.2:8000/get7Jobs'));
  //     print(res.statusCode); */
  //     http.Response res =
  //         await http.post(Uri.parse("http://10.4.1.200:4000/signup"));
  //     print(res.statusCode);

  //     /* http.Response response = await http.post(
  //         Uri.parse('http://10.0.2.2:8000/signup'),
  //         body: json.encode(user.toJson()),
  //         headers: {'Content-Type': 'application/json'}); */
  //     /*  print(user.email);
  //     print(response.statusCode); */

  //     /*  if (response.statusCode == 200) {
  //       final Map user = json.decode(response.body);
  //       print(user['data']);
  //       //insertedId=user['data']['insertedId'] as String;
  //       //print(insertedId);
  //       //return "1";
  //     } */
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  /* static Future<dynamic> add() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse('http://10.0.2.2:8000/get7Jobs'),
      );
      if (response.statusCode == 200) {
        print('true');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      //print(e);
      return false;
    }
  }

  static Future<bool> addUser() async {
    var client = http.Client();

    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:8000/signup'),
        body: {
          "username": "ggggg",
          "email": "shabna",
          "password": "shabna",
          "mobile": "1234"
        },
      );
      print(response.body);

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  } */
}
