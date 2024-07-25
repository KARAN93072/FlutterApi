import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api/models/post_model/post_model2.dart';
import 'package:http/http.dart' as http;

class GetApiHome extends StatelessWidget {
  const GetApiHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostModel2> postList3 = [];
    Future<List<PostModel2>> getGetApi() async {
      final response =
          await http.get(Uri.parse('https://jsonplaceholder.org/comments'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var i in data) {
          postList3.add(PostModel2.fromJson(i));
        }
      } else {
        postList3;
      }
      return postList3;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Congo, It\'s working...'),
      ),
      body: FutureBuilder(
        future: getGetApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading');
          } else {
            return ListView.builder(itemCount: postList3.length,itemBuilder: (context, index) {
              return ListTile(
                title: Text(postList3[index].userId.toString()),
              );
            });
          }
        },
      ),
    );
  }
}
