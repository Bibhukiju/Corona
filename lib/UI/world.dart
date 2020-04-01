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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("World data"),
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
                    return ListTile(
                      title: Card(
                        elevation: 4.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                                width: 100,
                                height: 80,
                                alignment: Alignment.centerLeft,
                                child: Text(index.toString() +". " +snapshot.data[index].country)),
                            Container(
                                width: 100,
                                height: 80,
                                alignment: Alignment.centerLeft,
                                child: Text((snapshot.data[index].totalcases)
                                    .toString())),
                            Container(
                              width: 100,
                                height: 80,
                                alignment: Alignment.centerLeft,
                              child: Text((snapshot.data[index].totalDeaths).toString())),
                            Container(
                              child: Text((snapshot.data[index].totalRecovered)
                                  .toString()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
            },
          ),
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
