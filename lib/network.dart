import 'package:http/http.dart' as http;
import 'package:news/logger.dart';
import 'models.dart';

Future<ApiSuccessfulResponse?> getModels({String? q, int count = 20}) async {
  // print("https://newsapi.org/v2/everything&${_ApiValues.apiKey}&q=${q ?? ''}&pageSize=$count");
  final queryUrl = Uri.parse("https://newsapi.org/v2/everything&${_ApiValues.apiKey}&q=${q ?? ''}&pageSize=$count");
  final userDataResponse = await http.get(queryUrl);
  if (userDataResponse.statusCode != 200) {
    logger.d("failed get from api with ${userDataResponse.statusCode} code");
    return null;
  }

}

class _ApiValues {
  static const String apiKey = "a42f9ef9bdd04587aabb296210bb4572";
}