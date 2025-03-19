import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movie_addict/src/data/app_exception.dart';
import 'package:movie_addict/src/data/network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  final token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MzZhMWYyODg0ZjJiZGM2NTYxMDQ5YWJmNTRkYTVhMyIsIm5iZiI6MTcyMzE5MjI4Mi41MzA4NTQsInN1YiI6IjVkOTZiYzY3NjYxMWI0MDAyOTFmOTY5ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ENfjrr-gTFG9ljFlwnfBmuq9chvGdUkvBRMehBXMSNQ';

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
}