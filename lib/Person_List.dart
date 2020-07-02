import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:startup_namer/Model/Person.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key key}) : super(key: key);


  @override
  PersonState createState() => new PersonState();
}
class PersonState extends State<PersonPage> {
   List<Person> PersonListe = [];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
    PersonListe.add(Person(lastName:"LOk", name:"eya",sexe: "f"));

  }

  @override
  Widget build(BuildContext context) {

    Widget widget;


      //TODO: search how to stop ListView going infinite list
      widget =  new ListView.builder(
          shrinkWrap:true,
          padding: const EdgeInsets.all(0.0),

          itemBuilder: (context, i) {
            if (i.isOdd) return new Divider();
            return _buildRow(PersonListe[i]);
          }
      );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Person"),
      ),
      body: widget,
    );
  }

  }

Widget _buildRow(Person persons) {

  var _biggerFont =const TextStyle(fontSize: 18.0);
  return new ListTile(
    title: new Text(persons.name + persons.lastName,
      style:  _biggerFont =const TextStyle(fontSize: 18.0),
    ),

    subtitle: new Text(persons.sexe),

    onTap: () {

    },
  );
}
