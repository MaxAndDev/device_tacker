import 'package:http/http.dart';
import 'dart:convert';
import '../model/data_model.dart';
import '../model/user_model.dart';
import 'urls.dart';

Future<PostList> fetchPost() async {
  final response = await get(url);

  if (response.statusCode == 200){
    return PostList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load ressource');
  }
}

Future postUser(userData) async {
  //TO DO create valid json from input object
  Map<String, String> headers = {"Content-type": "application/json"};

  final response = await post(urlUser , headers: headers, body: userData);

  if (response.statusCode == 200){
    return 'User created';
  } else {
    throw Exception('Failed to load ressource');
  }
}

