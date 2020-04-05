import 'package:flutter/material.dart';

class Precautions {
  String precautions;
  String whythis;
  Precautions(this.precautions, this.whythis);
}

List<Precautions> precautions = [
  Precautions("Wash your hands frequently",
      " Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands."),
  Precautions("Maintain social distancing",
      "When someone coughs or sneezes they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person coughing has the disease"),
  Precautions("Avoid touching eyes, nose and mouth",
      "Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick."),
  Precautions("Practice respiratory hygiene",
      "Droplets spread virus. By following good respiratory hygiene you protect the people around you from viruses such as cold, flu and COVID-19."),
  Precautions(
      "If you have fever, cough and difficulty breathing, seek medical care early",
      "National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections.")
];

class PrecautionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Precaution",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: precautions
                .map((f) => Container(
                      padding: EdgeInsets.all(20),
                      child: ExpansionTile(
                        title: Container(
                          margin: EdgeInsets.all(0),
                          child: Text(
                            f.precautions,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        children: <Widget>[Text(f.whythis)],
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
