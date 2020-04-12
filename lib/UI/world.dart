import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  List countryList;
  Future<String> _getWordlDAta() async {
    var response = await http.get("https://brp.com.np/covid/country.php");
    var getData = jsonDecode(response.body);
    if (this.mounted) {
      setState(() {
        countryList = [getData];
      });
    }
    return "hello";
  }

  @override
  void initState() {
    super.initState();
    _getWordlDAta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("World Data"),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                TextField();
                _getWordlDAta();
              })
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount:
            countryList == null ? 0 : countryList[0]["countries_stat"].length,
        itemBuilder: (context, i) {
          if (i == 0) {
            i++;
            return SizedBox();
          }
          return listItem(i);
        },
      ),
    );
  }

  Widget listItem(int i) {
    return Align(
      child: Card(
        child: ExpansionTile(
          title: SizedBox(
            height: 40,
            child: Text(
              i.toString() +
                  " " +
                  countryList[0]["countries_stat"][i]["country_name"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          children: <Widget>[
            Text("TotalCases: " + countryList[0]["countries_stat"][i]["cases"]),
            Text("Total recovered: " +
                countryList[0]["countries_stat"][i]["total_recovered"]),
            Text("Deaths: " + countryList[0]["countries_stat"][i]["deaths"]),
            Text("Active Cases " +
                countryList[0]["countries_stat"][i]["active_cases"]),
            Text("Critical Cases " +
                countryList[0]["countries_stat"][i]["serious_critical"])
          ],
        ),
      ),
    );
  }
}
