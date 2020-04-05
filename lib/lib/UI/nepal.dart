import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Nepal extends StatefulWidget {
  @override
  _NepalState createState() => _NepalState();
}

class _NepalState extends State<Nepal> {
  var url = "https://nepalcorona.info/api/v1/data/nepal";
  Autogenerated autogenerated;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var jsonData = jsonDecode(res.body);
    autogenerated = Autogenerated.fromJson(jsonData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Container myContains(String header, String imgl, Color col) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: col,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1)]),
          height: MediaQuery.of(context).size.height * .21,
          width: MediaQuery.of(context).size.width * .47,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                imgl,
                style: TextStyle(fontSize: 45),
              ),
              Text(
                header,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        );
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Nepal",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: autogenerated == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    myContains(
                        "Total Tested",
                        (autogenerated.testedTotal).toString(),
                        Colors.blue[200]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        myContains("Deaths", (autogenerated.deaths).toString(),
                            Colors.red),
                        myContains(
                            "Tested positive",
                            (autogenerated.testedPositive).toString(),
                            Colors.yellow[100]),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        myContains(
                            "Tested negative",
                            (autogenerated.testedNegative).toString(),
                            Colors.green.shade100),
                        myContains(
                            "Total Tested",
                            (autogenerated.testedTotal).toString(),
                            Colors.blue[200]),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    myContains(
                        "In Isolation",
                        (autogenerated.inIsolation).toString(),
                        Colors.blue[200]),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                        elevation: 2,
                        margin: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Updated At",
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text((autogenerated.latestSitReport.date)),
                          ],
                        )),
                  ],
                ),
              ));
  }
}

class Autogenerated {
  int testedPositive;
  int testedNegative;
  int testedTotal;
  int inIsolation;
  int deaths;
  String source;
  String updatedAt;
  LatestSitReport latestSitReport;

  Autogenerated(
      {this.testedPositive,
      this.testedNegative,
      this.testedTotal,
      this.inIsolation,
      this.deaths,
      this.source,
      this.updatedAt,
      this.latestSitReport});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    testedPositive = json['tested_positive'];
    testedNegative = json['tested_negative'];
    testedTotal = json['tested_total'];
    inIsolation = json['in_isolation'];
    deaths = json['deaths'];
    source = json['source'];
    updatedAt = json['updated_at'];
    latestSitReport = json['latest_sit_report'] != null
        ? new LatestSitReport.fromJson(json['latest_sit_report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tested_positive'] = this.testedPositive;
    data['tested_negative'] = this.testedNegative;
    data['tested_total'] = this.testedTotal;
    data['in_isolation'] = this.inIsolation;
    data['deaths'] = this.deaths;
    data['source'] = this.source;
    data['updated_at'] = this.updatedAt;
    if (this.latestSitReport != null) {
      data['latest_sit_report'] = this.latestSitReport.toJson();
    }
    return data;
  }
}

class LatestSitReport {
  String type;
  String sId;
  int no;
  String date;
  String url;
  String createdAt;
  String updatedAt;
  int iV;

  LatestSitReport(
      {this.type,
      this.sId,
      this.no,
      this.date,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.iV});

  LatestSitReport.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sId = json['_id'];
    no = json['no'];
    date = json['date'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['_id'] = this.sId;
    data['no'] = this.no;
    data['date'] = this.date;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
