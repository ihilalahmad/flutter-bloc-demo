import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_demo/model/post_model.dart';
import 'package:flutter_bloc_demo/utils/config.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(Config.postsUrl));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((post) {
          return PostModel(
              postId: post['postId'],
              id: post['id'],
              name: post['name'],
              email: post['email'],
              body: post['body']);
        }).toList();
      }
    } on SocketException {
      throw Exception('No internet connection');
    } on TimeoutException {
      throw Exception('Connection timeout error');
    }
    throw Exception('Something went wrong');
  }
}
