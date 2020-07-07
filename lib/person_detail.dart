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
      body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            children: <Widget>[
              new Card(
                child: new ListTile(

                  title: new Column(
                    children: <Widget>
                    [
                      new Text(persons.surName+"    "+persons.firstName),

                    ],
                  ),

                  trailing: Icon(Icons.account_circle),
                ),
              ),

            ],
          )
    );
  }


}