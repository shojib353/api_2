import 'dart:convert';

import 'package:api_practice_2/core/utils/constants/urls.dart';
import 'package:api_practice_2/data/models/post_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future fetchData(String url) async {
    //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE
    try {
      final response = await http.get(Uri.parse(url));

      //* STEP 02 : VALIDATE RESPONSE AND DECODE JSON
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch posts');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future sendData(String url, Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 201) {


      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<PostResponse> postData(String fullName, String email, String number, String password) async {
    // Map<String, String> header = {'toker': "hdjkashdhjdguiacvgdahjdhabkdvbhak"};

    // Map<String, String> body = {
    //   "name": fullName,
    //   "email": email,
    //   "number": number,
    //   "password": password,
    // };
    Map<String, dynamic> body = {"title": 'foo', "body": 'bar', "userId": "1"};
    /*
    {
    title: 'foo',
    body: 'bar',
    userId: 1,
    }
     */
    final response = await http.post(Uri.parse(postUrl), body: body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      return PostResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
