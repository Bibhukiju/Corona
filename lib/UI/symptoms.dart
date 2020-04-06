import 'package:flutter/material.dart';

class PrimarySymptoms {
  String symptoms;
  String image;
  PrimarySymptoms(this.symptoms, this.image);
}


class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

List<PrimarySymptoms> sSymptoms = [
  PrimarySymptoms("Diarrhea\n", "hi"),
  PrimarySymptoms("Aches and pain\n", "hi"),
  PrimarySymptoms("Nasal Congestions\n", "hi"),
  PrimarySymptoms("Runny nose\n", ""),
  PrimarySymptoms("Sore throat\n", ""),
];
List<PrimarySymptoms> pSymptoms = [
  PrimarySymptoms("Dry cough\n", "hi"),
  PrimarySymptoms("Fever\n", "hi"),
  PrimarySymptoms("Shortness in breathe\n", "hi"),
  PrimarySymptoms("Fatigue", ""),
];

class _SymptomsState extends State<Symptoms> {
  PrimarySymptoms primarySymptoms;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptoms"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionTile(
                title: Text("Primary Symptoms",
                style: TextStyle(fontSize: 25),
                ),
                children: pSymptoms
                    .map((f) => Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "->   " + f.symptoms,
                            style: TextStyle(fontStyle: FontStyle.italic,
                            fontSize: 20
                            ),
                          ),
                        ))
                    .toList(),
                    ),
                    ExpansionTile(
                title: Text("Less Frequent Symptoms",
                style: TextStyle(fontSize: 25),
                ),
                children: sSymptoms
                    .map((f) => Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "->   " + f.symptoms,
                            style: TextStyle(fontStyle: FontStyle.italic,
                            fontSize: 20
                            ),
                          ),
                        ))
                    .toList(),
                    )
          ],
          
        ),
      ),
    );
  }
}
