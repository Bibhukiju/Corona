import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Myths extends StatefulWidget {
  @override
  _MythsState createState() => _MythsState();
}

class _MythsState extends State<Myths> {
  var url = "https://nepalcorona.info/api/v1/myths";
  Pmyths pmyths;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var jsonData = jsonDecode(res.body);
    pmyths = Pmyths.fromJson(jsonData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Myth",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: pmyths == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: pmyths.data
                      .map((f) => ExpansionTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text("Myth"),
                                Card(
                                  child: f.mythNp == null
                                      ? Container(margin: EdgeInsets.all(10),
                                        child: Text(f.myth))
                                      : Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(f.mythNp)),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              Text("Reality",
                              style: TextStyle(color: Colors.green,
                              fontSize: 20
                              ),
                              ),
                              f.realityNp == null
                                  ? Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(f.reality))
                                  : Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(f.realityNp,
                                    ))
                            ],
                          ))
                      .toList(),
                ),
              ));
  }
}

class Pmyths {
  List<Data> data;
  int total;
  int limit;
  int start;
  int page;

  Pmyths({this.data, this.total, this.limit, this.start, this.page});

  Pmyths.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    start = json['start'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['limit'] = this.limit;
    data['start'] = this.start;
    data['page'] = this.page;
    return data;
  }
}

class Data {
  String sId;
  String type;
  String lang;
  String myth;
  String mythNp;
  String reality;
  String realityNp;
  String sourceName;
  String sourceUrl;
  String createdAt;
  String updatedAt;
  int iV;
  String imageUrl;

  Data(
      {this.sId,
      this.type,
      this.lang,
      this.myth,
      this.mythNp,
      this.reality,
      this.realityNp,
      this.sourceName,
      this.sourceUrl,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    lang = json['lang'];
    myth = json['myth'];
    mythNp = json['myth_np'];
    reality = json['reality'];
    realityNp = json['reality_np'];
    sourceName = json['source_name'];
    sourceUrl = json['source_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['lang'] = this.lang;
    data['myth'] = this.myth;
    data['myth_np'] = this.mythNp;
    data['reality'] = this.reality;
    data['reality_np'] = this.realityNp;
    data['source_name'] = this.sourceName;
    data['source_url'] = this.sourceUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
