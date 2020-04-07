import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  Future<List<Datas>> _getDatas() async {
    var data = await http.get("https://nepalcorona.info/api/v1/data/world");
    var jsonData = json.decode(data.body);

    List<Datas> datas = [];
    for (var u in jsonData) {
      Datas datum = Datas(
          u["id"],
          u["country"],
          u["totalCases"],
          u["newcases"],
          u["totalDeaths"],
          u["newDeaths"],
          u["activeCases"],
          u["totalRecovered"],
          u["criticalCases"],
          u["v"]);
      datas.add(datum);
    }
    print(datas.length);
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "World data",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(

          future: _getDatas(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 1) {
                    return SizedBox();
                  }
                  return Container(
                    child: ExpansionTile(
                      title: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          index == 0
                              ? snapshot.data[index].country
                              : (index - 1).toString() +
                                  " " +
                                  snapshot.data[index].country,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      children: <Widget>[
                        Text(
                          "Deaths   " +
                              (snapshot.data[index].totalDeaths).toString(),
                          textAlign: TextAlign.left,
                        ),
                        Text("Total cases   " +
                            (snapshot.data[index].totalcases).toString()),
                        Text("Total Recovered   " +
                            (snapshot.data[index].totalRecovered).toString()),
                        Text("Active Cases   " +
                            (snapshot.data[index].activeCases).toString()),
                      ],
                    ),
                  );
                },
              );
          },
        ),
      ),
    );
  }
}

class Datas {
  String id;
  String country;
  int totalcases;
  int newcases;
  int totalDeaths;
  int newDeaths;
  int activeCases;
  int totalRecovered;
  int criticalCases;
  int v;

  Datas(
      this.id,
      this.country,
      this.totalcases,
      this.newcases,
      this.totalDeaths,
      this.newDeaths,
      this.activeCases,
      this.totalRecovered,
      this.criticalCases,
      this.v);
}
