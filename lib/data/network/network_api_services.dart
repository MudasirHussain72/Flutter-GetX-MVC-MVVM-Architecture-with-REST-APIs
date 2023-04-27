import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkaApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExeption();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }
    return responseJson;
  }

  // for post api
  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              //if data form is raw
              body: jsonEncode(data)
              //if data form is FORM
              // body: data,
              )
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExeption();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        // throw InvalidUrlException();
        //backend dev mistake
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataExeption(
            'Error Occured while communicating with server ${response.statusCode}');
    }
  }
}
