import 'package:flutter/material.dart';
import 'package:startup_namer/Person_List.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


//*
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: new PersonPage(),
    );
  }
}
