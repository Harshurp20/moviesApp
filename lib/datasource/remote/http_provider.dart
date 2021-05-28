import 'package:flutter_movie/util/contants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';
import 'dart:io';

class HTTPProvider {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(Constant.baseUrl + url));
      print('HTTPProvider get requestUrl: ${Constant.baseUrl + url}"');
      responseJson = _response(response);
    } on SocketException {
      throw HTTPException(message: 'No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    } else {
      throw HTTPException(
          code: response.statusCode, message: response.body.toString());
    }
  }
}
