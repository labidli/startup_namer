import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:startup_namer/Model/person.dart';
import 'person_detail.dart';

class PersonPage extends StatefulWidget {
  

  PersonPage({Key key}) : super(key: key);

  @override
  PersonState createState() => new PersonState();
}
class PersonState extends State<PersonPage> {
  StreamController<Person> streamController;
  Future <List<Person>> futureListPersons;
  List<Person> listPersons ;
  final _saved = <Person>{};
  int i;

  @override
  void initState() {
    //streamController = StreamController();
    //streamController.stream.listen((p) => setState(() =>  _fetchPersonsList()));
    _fetchPersonsList().then((value) {
      setState(() {
        listPersons.addAll(value);
      });
    });

    futureListPersons=_fetchPersonsList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("List of Person"),
                ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: StreamBuilder<List<Person>>(
                stream: futureListPersons.asStream(),
                initialData:  listPersons,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    return ListView.builder(
                    shrinkWrap: true,

                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      listPersons =snapshot.data;
                      return _buildRow( listPersons, context);
                     },
                    );


                  } else {return CircularProgressIndicator();}
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );


  }

Widget _buildRow( listPersons,BuildContext context) {
  final alreadySaved = _saved.contains(listPersons);
  var _biggerFont =const TextStyle(fontSize: 18.0);
  return Card(
    child: Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),

        //isSelected: isSelected,
      child: new ListTile(
          title: new Text( listPersons[i].firstName + "  "+ listPersons[i].surName,

            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),

          subtitle: new Text(listPersons[i].email,
            style: TextStyle(
                color: Colors.grey.shade600
            ),),
          trailing:Icon(
            alreadySaved ? Icons.account_circle : Icons.arrow_forward,
            color: alreadySaved ? Colors.red : null,
          ),

          onTap: () {
            Navigator.of(context).push<void>(_createRoute(listPersons));

            setState(() {
              if (alreadySaved) {
                _saved.remove(listPersons);
              } else {
                _saved.add(listPersons);
              }
            });
          }
      ),
    ),
  );
}

// ouvrir une fichier json
  Future<String> _loadAPersonAsset() async {

    return await rootBundle.loadString('assets/generated.json');
  }
Future<List<Person>> _fetchPersonsList( ) async {

  //var _listPersons =List<Person>();

    String jsonString =await _loadAPersonAsset();
    final jsonResponses = json.decode(jsonString);
    if (jsonResponses.statusCode == 200) {

      for (var jsonResponse in jsonResponses) {
        return jsonResponse.map((job) => new Person.fromJson(jsonResponse)).toList();
       //_listPersons.add(new Person.fromJson(jsonResponse));
      }
  //


      //return  _listPersons  ;

    }else {
      return Future.error("error d importation des données json");
   }

  }


  @override
  void dispose() {
    super.dispose();
    streamController?.close();
    streamController = null;
  }

//animation  et navigation vers Page detail person
  Route _createRoute(Person persons) {
    return PageRouteBuilder<SlideTransition>(
      pageBuilder: (context, animation, secondaryAnimation) => DetailPersonPage(persons: persons),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero);
        var curveTween = CurveTween(curve: Curves.ease);

        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: child,
        );
      },
    );
  }



}



