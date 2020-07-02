import 'package:flutter/material.dart';
import 'package:startup_namer/Model/Person.dart';

class DetailPersonPage extends StatelessWidget {
final String name;

  DetailPersonPage( {Key key, @required  this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second page  "),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(name),
      ),
    );
  }
}