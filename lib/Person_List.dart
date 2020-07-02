import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:startup_namer/Model/Person.dart';

import 'Person_detail.dart';

class PersonPage extends StatefulWidget {
  

  PersonPage({Key key}) : super(key: key);

  @override
  PersonState createState() => new PersonState();
}
class PersonState extends State<PersonPage> {
   // ignore: non_constant_identifier_names
  List<Person> _PersonListe = [];
  int i;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    _PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
    _PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
    _PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
    _PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
    _PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
    _PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
    _PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
    _PersonListe.add(Person(lastName:"labi", name:"eya",sexe: "f"));
  }

  @override
  Widget build(BuildContext context) {

    Widget widget;


      //TODO: search how to stop ListView going infinite list
      widget =  new ListView.builder(
          itemCount: _PersonListe.length,
          itemBuilder: (context, i) {
            //if (i.isOdd) return new Divider();

            return _buildRow(_PersonListe[i],context);



          },
      );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Person"),
      ),
      body: widget,
    );
  }

  }

Widget _buildRow( Person persons,BuildContext context) {

  var _biggerFont =const TextStyle(fontSize: 18.0);
  int  i;
  return new ListTile(
      title: new Text( persons.name + "  "+ persons.lastName,
        style:  _biggerFont =const TextStyle(fontSize: 18.0),
                     ),


      subtitle: new Text(persons.sexe),
      trailing:Icon(Icons.arrow_forward),

      onTap: () {

        print(persons.name);
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> DetailPersonPage(name : persons.name)
            ));
      }
  );
}





