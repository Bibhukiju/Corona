import 'package:flutter/material.dart';
import 'package:lastcorona/UI/nepal.dart';

void main()=>runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:
      {
        '/':(context)=>DashBoard(),
        'nepal':(context)=>Nepal()
      },
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
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .23,
        width: MediaQuery.of(context).size.width * .47,
        child: FlatButton(
        onPressed: (){print("hello");
        Navigator.pushNamed(context, 'nepal');
        },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(backgroundImage: NetworkImage(imgl),
                backgroundColor: Colors.white,
                radius: 60,
                ),
                Text(header)
              ],
            ),
          ),   
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    myContains('Nepal', "http://img.freeflagicons.com/thumb/round_icon/nepal/nepal_640.png"),
                    myContains("World", "https://cdn5.vectorstock.com/i/1000x1000/65/04/planet-earth-cartoon-character-vector-1036504.jpg"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    myContains('Symptoms', "https://thumbs.dreamstime.com/t/wheezing-coughing-boy-signs-sickness-colorful-flat-vector-illustration-isolated-white-background-wheezing-coughing-boy-signs-128116469.jpg"),
                    myContains("Precautions", "https://image.shutterstock.com/image-vector/guy-medical-mask-on-his-260nw-1444546286.jpg"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    myContains('HelpLine', "https://www.safehelpline.org/sites/default/files/inline-images/SHL_icon_buttons-telephonehelpline_V2.jpg"),
                    myContains("Myth Buster", "https://th.bing.com/th?id=OIP.h4pt0LdLbujLijQ1TR2_yQHaFj&pid=Api&rs=1"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    myContains('Hospitals(for Nepal)', "https://i.pinimg.com/236x/57/20/27/572027372cc8f769ee82ee8bff7dde42--illustration-kids-stock-illustrations.jpg?b=t"),
                    myContains('About', "https://th.bing.com/th?id=OIP.wQXfxYT-sTJyhTCa7akaWAAAAA&pid=Api&rs=1"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
