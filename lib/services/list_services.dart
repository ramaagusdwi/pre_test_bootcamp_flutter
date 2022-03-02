import 'dart:convert';

import 'package:pre_test_app/models/post_model.dart';
import 'package:http/http.dart' as http;

class ListPostService {
  static Future<List<PostModel>> getListPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List body = jsonDecode(response.body);

    return body.map((e) => PostModel.fromJson(e)).toList();
  }

  static Future<PostModel> getPost(String id) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> body = jsonDecode(response.body);

    return PostModel.fromJson(body);
  }
}
