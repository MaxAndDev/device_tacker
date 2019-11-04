import 'package:http/http.dart';
import 'dart:convert';
import '../model/data_model.dart';
import 'urls.dart';

Future<PostList> fetchPost() async {
  final response = await get(url);

  if (response.statusCode == 200){
    return PostList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load ressource');
  }
}

