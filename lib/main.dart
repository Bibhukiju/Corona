import 'package:flutter/material.dart';
import 'package:lastcorona/UI/frequent_QA.dart';
import 'package:lastcorona/UI/hospitals.dart';
import 'package:lastcorona/UI/myths.dart';
import 'package:lastcorona/UI/about.dart';
import 'package:lastcorona/UI/news.dart';
import 'package:lastcorona/UI/precautions.dart';
import 'package:lastcorona/UI/symptoms.dart';
import 'package:lastcorona/UI/world.dart';
import 'package:lastcorona/UI/nepal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid Diary",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => DashBoard(),
        'nepal': (context) => Nepal(),
        'world': (context) => World(),
        'hospitals': (context) => Hospitals(),
        'myth buster': (context) => Myths(),
        'faqs': (context) => FAQs(),
        'precautions': (context) => PrecautionPage(),
        'symptoms': (context) => Symptoms(),
        'about us': (context) => NewsPage()
      },
      theme: ThemeData(primaryColor: Colors.white, primarySwatch: Colors.red),
    );
  }
}

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Container myContains(String header, String imgl) => Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .23,
        width: MediaQuery.of(context).size.width * .47,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, header.toLowerCase());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(imgl),
                backgroundColor: Colors.white,
                radius: MediaQuery.of(context).size.height * 0.06,
              ),
              Text(header)
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400],
                  offset: Offset(-4, -4),
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(20)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Diary"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: <Widget>[
            myContains('Nepal',
                "http://cn.flagbox.net/flags/rflags_1/np.png"),
            myContains("World",
                "https://cdn5.vectorstock.com/i/1000x1000/65/04/planet-earth-cartoon-character-vector-1036504.jpg"),
            myContains('Symptoms',
                "https://thumbs.dreamstime.com/t/wheezing-coughing-boy-signs-sickness-colorful-flat-vector-illustration-isolated-white-background-wheezing-coughing-boy-signs-128116469.jpg"),
            myContains("Precautions",
                "https://image.shutterstock.com/image-vector/guy-medical-mask-on-his-260nw-1444546286.jpg"),
            myContains('Hospitals',
                "https://i.pinimg.com/236x/57/20/27/572027372cc8f769ee82ee8bff7dde42--illustration-kids-stock-illustrations.jpg?b=t"),
            myContains("Myth Buster",
                "https://www.1pezeshk.com/wp-content/uploads/2014/05/5-8-2014-4-57-19-PM.jpg"),
            myContains('FAQS',
                "https://mickirose.files.wordpress.com/2015/04/faq-icon.jpg"),
            myContains('About us',
                "https://avatars3.githubusercontent.com/u/8184686?s=460&v=4"),
          ],
        ),
      ),
    );
  }
}
