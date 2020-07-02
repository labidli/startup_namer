import 'package:flutter/material.dart';
class DetailPersonPage extends StatefulWidget {
 final int index;

 DetailPersonPage(this.index);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail of person'),
        ),
            body: Center(
        child: Text(''),
    ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}