import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Nepal extends StatefulWidget {
  @override
  _NepalState createState() => _NepalState();
}

class _NepalState extends State<Nepal> {
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
    Container myContains(String header, String imgl) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black,
            spreadRadius: 1
            )
          ]
        ),
        height: MediaQuery.of(context).size.height * .23,
        width: MediaQuery.of(context).size.width * .47,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(imgl,
            style: TextStyle(fontSize: 45),

            ),
            Text(header,
            style: TextStyle(
              fontSize: 20
            ),
            )
          ],
        ),   
      );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: FutureBuilder(
            future: _getDatas(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.data==null)
              {
                return Container(child: Center(child: CircularProgressIndicator(),),);
              }
              else
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                     children: <Widget>[
                       Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: <Widget>[
                         myContains("Total Cases", snapshot.data[185].totalcases.toString()),
                         myContains(" Deaths", snapshot.data[185].totalDeaths.toString())
                       ],),
                       SizedBox(
                         height: 10,
                       ),
                       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                         myContains("Active Case", snapshot.data[185].activeCases.toString()),
                         myContains("Recovered", snapshot.data[185].totalRecovered.toString())
                       ],),
                       SizedBox(
                         height: 10,
                       ),
                       Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: <Widget>[
                          myContains("Critical Cases", snapshot.data[185].newDeaths.toString()),
                         myContains("New Deaths", snapshot.data[185].criticalCases.toString())
                       ],)
                     ], 
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
