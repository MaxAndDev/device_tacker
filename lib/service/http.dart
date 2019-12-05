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

Future postUserLogin(login_data) async {
  //TO DO create valid json from input object
  Map<String, String> headers = {"Content-type": "application/json"};

  final response = await post(urlUserLogin , headers: headers, body: login_data);

  if (response.statusCode == 200){
    return response.body;
  } else {
    throw Exception('Failed to load ressource');
  }
}

