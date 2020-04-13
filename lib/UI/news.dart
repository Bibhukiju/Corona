import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lastcorona/UI/newswebpage.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List newsList;
  Future<String> _getNews() async {
    var res = await http.get("https://nepalcorona.info/api/v1/news");
    var getData = jsonDecode(res.body);
    if (this.mounted) {
      setState(() {
        newsList = [getData];
      });
    }
    return "hello";
  }

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: newsList == null ? 0 : newsList[0]["data"].length,
        itemBuilder: (BuildContext context, int index) {
          return listItem(index);
        },
      ),
    );
  }

  Widget listItem(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          var route = new MaterialPageRoute(
              builder: (BuildContext context) =>
                  NewsWeb(links: (newsList[0]["data"][i]["url"])));
          Navigator.of(context).push(route);
        },
        child: Card(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image(
                  image: NetworkImage(newsList[0]["data"][i]["image_url"]),
                ),
                SizedBox(height: 30),
                Text(newsList[0]["data"][i]["title"]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
