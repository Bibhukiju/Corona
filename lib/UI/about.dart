import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  List<Person> person = [
    Person(
        "Bibhu Kiju",
        "https://avatars3.githubusercontent.com/u/46820449?s=400&u=8b8e8e6335520fd97c60c3b42ba543f94cfbfd8c&v=4",
        "bibhukiju@gmail.com",
        "9863849224",
        "https://github.com/bibhukiju",
        "Suryabinayak,Bhaktapur"),
    Person(
        "Ram jonchhen",
        "https://avatars0.githubusercontent.com/u/46254432?s=460&u=cc1818c2d59a6902b7da5b307b49135c55075558&v=4",
        "ramjonchhhen@gmail.com",
        "984100000000",
        "https://github.com/ramjonchhen",
        "Suryabinayak"),
    Person(
        "Naarayan Shrestha",
        "https://scontent.fktm7-1.fna.fbcdn.net/v/t1.0-9/36298425_140419826844087_5923158968070307840_o.jpg?_nc_cat=106&_nc_sid=09cbfe&_nc_ohc=EGl-zo1ZcdoAX_hPUet&_nc_ht=scontent.fktm7-1.fna&oh=147bed97e3ecc51170b7232ebbf5abc6&oe=5EB21D7F",
        "naaraayen@gmail.com",
        "9864590611",
        "https://github.com/Narayan0611",
        "Mugitar,RameChhap"),
    Person(
        "Bimal Shrestha",
        "https://avatars3.githubusercontent.com/u/60249948?s=400&u=9953ed33aff99e3cfd0014d34a80ad109589a31e&v=4",
        "sayresthabimal@gmail.com",
        "9861165844",
        "https://github.com/bimalstha",
        "kamalbinayak, Bhaktapur"),
    Person(
        "Nabin Bhandari",
        "https://avatars2.githubusercontent.com/u/46418794?s=460&u=f1b2a6b21f7fcfd35d7df6e8032cf3816d0f97d2&v=4",
        "nfornabin@gmail.com",
        "9812870775",
        "https://github.com/Nabiin",
        "Dang,Nepal"),
    Person(
        "Laxman Jonchhen",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Question_Mark.svg/1200px-Question_Mark.svg.png",
        "laxmanJonchhen@gmail.com",
        "9813551270",
        "https://github.com/LaxmanJonchhen12",
        "Suryabinayak,Nepal")
  ];
  Person selectedPerson;
  List<DropdownMenuItem> generatedItems(List<Person> person) {
    List<DropdownMenuItem> items = [];
    for (var i in person) {
      items.add(DropdownMenuItem(
        child: Text(i.name),
        value: i,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About us"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Contributers",
                textAlign: TextAlign.center,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedPerson,
                    items: generatedItems(person),
                    onChanged: (items) {
                      setState(() {
                        selectedPerson = items;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * .1,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(selectedPerson != null
                        ? selectedPerson.imageUrl
                        : "https://avatars3.githubusercontent.com/u/46820449?s=400&u=8b8e8e6335520fd97c60c3b42ba543f94cfbfd8c&v=4"),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.grey.shade100,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 1,
                          children: <Widget>[
                            Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(Icons.person),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    (selectedPerson != null
                                        ? selectedPerson.name
                                        : "Bibhu kiju"),
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Expanded(child: SizedBox())
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(MdiIcons.emailOutline),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    (selectedPerson != null
                                        ? selectedPerson.email
                                        : "bibhuKiju@gmail.com"),
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(MdiIcons.github),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      (selectedPerson != null
                                          ? selectedPerson.github
                                          : "https://github.com/bibhukiju"),
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(MdiIcons.home),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    (selectedPerson != null
                                        ? selectedPerson.address
                                        : "Suryabinayak,Bhaktapur"),
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(MdiIcons.phone),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    (selectedPerson != null
                                        ? selectedPerson.contact
                                        : "9863849224"),
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Center(child: Text("your Intro here"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Person {
  String name;
  String imageUrl;
  String email;
  String contact;
  String github;
  String address;
  Person(this.name, this.imageUrl, this.email, this.contact, this.github,
      this.address);
}
