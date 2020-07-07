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
   // ignore: non_constant_identifier_names
  List<Person> listPersons = List<Person>();

  int i;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    _fetchPersonsList().then((value) {
      setState(() {
        listPersons.addAll(value);
      });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    Widget widget;


      //TODO: search how to stop ListView going infinite list
      widget =  new ListView.builder(
          shrinkWrap:true,

        itemCount: listPersons.length,
          itemBuilder: (context, i) {



            return _buildRow(listPersons[i],context);



          },

      );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List of Person"),
      ),
      body: widget,
    );
  }



Widget _buildRow( Person persons,BuildContext context) {

  var _biggerFont =const TextStyle(fontSize: 18.0);
  return Card(
    child: Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),

        //isSelected: isSelected,
      child: new ListTile(
          title: new Text( persons.firstName + "  "+ persons.surName,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),


          subtitle: new Text(persons.sexe,
            style: TextStyle(
                color: Colors.grey.shade600
            ),),
          trailing:Icon(Icons.arrow_forward),

          onTap: () {
            Navigator.of(context).push<void>(_createRoute(persons));


      ),
    ),
  );

}
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

  Future<String> _loadAPersonAsset() async {

    return await rootBundle.loadString('assets/generated.json');
  }
  Future<List<Person >> _fetchPersonsList() async {

    List<Person> _listPersons = List<Person>();


    String jsonString = await _loadAPersonAsset();
    final jsonResponses = json.decode(jsonString);
    for (var jsonResponse in jsonResponses) {
      _listPersons.add(new Person.fromJson(jsonResponse));
    }

return _listPersons;
  }

}



