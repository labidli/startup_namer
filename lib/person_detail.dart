import 'package:flutter/material.dart';
import 'package:startup_namer/Model/person.dart';

class DetailPersonPage extends StatelessWidget {
Person persons;
DetailPersonPage( { @required  this.persons}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail persons "),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Name :" + persons.surName+"  lastName :"+persons.firstName),

      ),
    );
  }
}