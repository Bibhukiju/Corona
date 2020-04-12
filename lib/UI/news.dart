import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List newsList;
  Future<String>  () async {
    var res = await http.get("https://nepalcorona.info/api/v1/news");
    var getData = jsonDecode(res.body);
    if (this.mounted) {
      setState(() {
        newsList = [getData];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: newsList == null ? 0 : newsList[0]["data"].length,
        itemBuilder: (BuildContext context, int index) {
          return listItem(index);
        },
      ),
    );
  }
  Widget listItem(int i)
    {
      return Card(
        child: ExpansionTile(
          title: Text(newsList[0]["data"][i]["title"]),
        ),
      );
    }
}
