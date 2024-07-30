import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api/models/post_model/post_model2.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel2> postList2 = [];
  Future<List<PostModel2>> getPostApi2() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.org/comments"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        postList2.add(PostModel2.fromJson(i));
      }
      return postList2;
    } else {
      postList2;
    }
    return postList2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi2(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading'));
                } else {
                  return ListView.builder(
                      itemCount: postList2.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('User ID: ${postList2[index].userId}'),
                          subtitle:
                              Text('Comment: ${postList2[index].comment}'),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
