import 'package:flutter/material.dart';
import 'package:super_smash_bros_cards/Models/SmashBrosPerson.dart';
import 'package:flutter/foundation.dart';

class SmashBrosCardDetails extends StatelessWidget
{
  final SmashBrosPerson person;

  SmashBrosCardDetails({@required this.person});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(person.imgUrl),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text(person.id.toString()),
                      ),
                      ListTile(
                        title: Text("Name"),
                        subtitle: Text(person.name),
                      ),
                      ListTile(
                        title: Text("Final Smash"),
                        subtitle: Text(person.final_smash),
                      ),
                      ListTile(
                        title: Text("Gender"),
                        subtitle: Text(person.gender),
                      ),
                      ListTile(
                        title: Text("Appears in"),
                        subtitle: Text(person.appears_in),
                      ),
                      ListTile(
                        title: Text("Console of origin"),
                        subtitle: Text(person.console_of_origin),
                      ),
                      ListTile(
                        title: Text("Universe"),
                        subtitle: Text(person.universe),
                      ),
                      ListTile(
                        title: Text("Species"),
                        subtitle: Text(person.species),
                      ),
                      ListTile(
                        title: Text("Home world"),
                        subtitle: Text(person.home_world),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
