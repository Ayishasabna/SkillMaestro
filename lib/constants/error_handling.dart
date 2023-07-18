import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skillmaestro/constants/utils.dart';

//import 'package:dio/dio.dart';

void dio = Dio();
// ignore: non_constant_identifier_names
void DioErrorHandle({
  required Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.data)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.data)['error']);
      break;
    default:
      showSnackBar(context, response.data);
  }
}
