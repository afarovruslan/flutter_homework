import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:news/logger.dart';
import 'models.dart';

Future<ApiResponse?> getModels({String q="новости", int count = 20}) async {
  var queryString = "https://newsapi.org/v2/everything?apiKey=${_ApiValues.apiKey}&q=$q&language=ru&pageSize=$count";
  final queryUrl = Uri.parse(queryString);
  final userDataResponse = await http.get(queryUrl);
  if (userDataResponse.statusCode != 200) {
    logger.d("failed get from api with code ${userDataResponse.statusCode}");
    return null;
  }
  final resp = decodeResponse(userDataResponse.body);
  if (resp.status != "ok") {
    logger.d("response from api received, but ${resp.message}");
    return null;
  }
  logger.d("successful parse $count articles");
  return resp;
}

ApiResponse decodeResponse(String resp) {
  final map = jsonDecode(resp) as Map<String, dynamic>;
  return ApiResponse.fromJson(map);
}

class _ApiValues {
  static const String apiKey = "a42f9ef9bdd04587aabb296210bb4572";
}