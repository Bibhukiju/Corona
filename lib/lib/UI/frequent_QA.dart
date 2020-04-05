import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  var url = "https://nepalcorona.info/api/v1/faqs";
  FrequentQas faqs;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var jsonData = jsonDecode(res.body);
    faqs = FrequentQas.fromJson(jsonData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQs",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: faqs == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 1,
              children: faqs.data
                  .map((f) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                                child: Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text("Question",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.red,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900)),
                                  f.questionNp==null?Text(f.question):Text(f.questionNp),
                                  Text("Answer",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.green,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900)),
                                  f.answerNp==null?Text(f.answer):Text(f.answerNp,
                                  overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                      ),
                    ],
                  ))
                  .toList()),
    );
  }
}

class FrequentQas {
  List<Data> data;
  int total;
  int limit;
  int start;
  int page;

  FrequentQas({this.data, this.total, this.limit, this.start, this.page});

  FrequentQas.fromJson(Map<String, dynamic> json) {
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
  String question;
  String questionNp;
  String answer;
  String answerNp;
  String category;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.sId,
      this.type,
      this.lang,
      this.question,
      this.questionNp,
      this.answer,
      this.answerNp,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    lang = json['lang'];
    question = json['question'];
    questionNp = json['question_np'];
    answer = json['answer'];
    answerNp = json['answer_np'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['lang'] = this.lang;
    data['question'] = this.question;
    data['question_np'] = this.questionNp;
    data['answer'] = this.answer;
    data['answer_np'] = this.answerNp;
    data['category'] = this.category;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
