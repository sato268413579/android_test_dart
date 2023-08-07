import 'package:android_test/model/Test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoriesPage extends StatefulWidget {
  const HistoriesPage({super.key});

  @override
  State<HistoriesPage> createState() => _HistoriesPageState();
}
class _HistoriesPageState extends State<HistoriesPage> {
  List<Test> itemslist = [];

  Future<void> getHistries() async {
    var response = await http.get(Uri.parse('http://172.18.215.198:1323'));
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      setState(() {
        responseBody.forEach((key, value) {
          var test = Test(id: key, name: value);
          itemslist.add(test);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getHistries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar の背景を透明にする
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage('images/backgorund-image.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        child: ListView.builder(
          itemCount: itemslist.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(itemslist[index].name),
                    // subtitle: Text(items[index]['name']),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}