import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/models/user_model/user_model.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatelessWidget {
  UserScreen({super.key});
  List<UserDetail> userList = [];
  @override
  Widget build(BuildContext context) {

    ///API Calling...
    Future<List<UserDetail>> getUserApi() async {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var i in data) {
          UserDetail userDetail = UserDetail(name: i['name'], id: i['id']);
          userList.add(userDetail);
        }
      } else {
        userList;
      }
      return userList;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getUserApi(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(''),
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetail {
  String name;
  int id;
  UserDetail({required this.name, required this.id});
}