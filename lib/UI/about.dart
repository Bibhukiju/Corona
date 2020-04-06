import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  List<Person> person = [
    Person(
        "Bibhu kiju",
        "https://www.shareicon.net/data/2016/01/24/708382_people_512x512.png",
        "Bibhukiju@gmail.com",
        "9863849224",
        "https://github.com/bibhukiju",
        "Suryabinayak"),
    Person(
        "Ram jonchhen",
        "https://fiverr-res.cloudinary.com/t_profile_original,q_auto,f_auto/profile/photos/45095995/original/user_avatar_account_profile_code_developer_software-512.png",
        "ramjonchhhen@gmail.com",
        "984100000000",
        "https://github.com/ramjonchhen",
        "Suryabinayak"),
    Person(
        "Naarayan Shrestha",
        "https://image.freepik.com/free-vector/software-language-programmer-avatar_24877-763.jpg",
        "naaraayen@gmail.com",
        "9864590611",
        "https://github.com/Narayan0611",
        "Mugitar,RameChhap"),
    Person(
        "Bimal Shreatha",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQS6Gf3dKOi0F63vBdhwt8ttxuuVX6s44oXPeyRuQVxhHFZMrdi&usqp=CAU",
        "sayresthabimal@gmail.com",
        "9861165844",
        "https://github.com/bimalstha",
        "kamalbinayak, Bhaktapur"),
    Person(
        "Nabin Bhandari",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT-WM-2ZK0wd96DnEDzKFBbUUUBjcUYp85y4d0DHSscpAAbhEA_&usqp=CAU",
        "nfornabin@gmail.com",
        "9812870775",
        "https://github.com/Nabiin",
        "Dang,Nepal"),
        Person(
        "Laxman Jonchhen",
        "https://pickaface.net/gallery/avatar/Eminero5439f53ce66cd.png",
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
                    backgroundImage: NetworkImage(
                        selectedPerson != null ? selectedPerson.imageUrl : "h"),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey.shade100,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Name:  " +
                                  (selectedPerson != null
                                      ? selectedPerson.name
                                      :"Bibhu kiju"),
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "Email: " +
                                  (selectedPerson != null
                                      ? selectedPerson.email
                                      : ""),
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "Github: " +
                                  (selectedPerson != null
                                      ? selectedPerson.github
                                      : ""),
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "Address: " +
                                  (selectedPerson != null
                                      ? selectedPerson.address
                                      : ""),
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "Contact: " +
                                  (selectedPerson != null
                                      ? selectedPerson.contact
                                      : ""),
                              style: TextStyle(fontSize: 17),
                            ),
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
