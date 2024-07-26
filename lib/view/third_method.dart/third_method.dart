import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/models/user_model/user_model.dart';
import 'package:http/http.dart' as http;

class ThirdMethod extends StatelessWidget {
  ThirdMethod({super.key});
  List<UserModel> allUserList = [];
  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/d24f9761-dfba-4759-bcda-f42f3dd539b7'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        allUserList.add(UserModel.fromJson(i));
      }
    } else {
      allUserList;
    }
    return allUserList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is my last Try...'),
      ),
      body: Expanded(
        child: FutureBuilder(
          future: getUserApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        ReusableRow(
                            title: 'Name',
                            value: snapshot.data![index].name.toString()),
                        ReusableRow(
                            title: 'Email',
                            value: snapshot.data![index].email.toString())
                      ],
                    ),
                  ),
                );
              });
            }
          },
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
  }
}
