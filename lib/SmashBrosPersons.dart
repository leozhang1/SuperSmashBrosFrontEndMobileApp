import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:super_smash_bros_cards/SmashBros/SmashBrosCardDetails.dart';
import 'Models/SmashBrosPerson.dart';

class SmashBrosPersons extends StatefulWidget
{
  final String title;
  final Drawer myDrawer;

  // add a constructor
  SmashBrosPersons({Key key, this.title, @required this.myDrawer})
      : super(key: key);

  @override
  _SmashBrosPersonsState createState() => _SmashBrosPersonsState();
}

class _SmashBrosPersonsState extends State<SmashBrosPersons>
{
  Random r;
  List<Color> colorOptions;
  List<SmashBrosPerson> persons = [];
  DatabaseReference refData = FirebaseDatabase.instance.reference();

  @override
  void initState()
  {
    super.initState();
    r = new Random();
    colorOptions = <Color>[
      Colors.amber,
      Colors.blue,
      Colors.yellow,
      Colors.green,
      Colors.red,
      Colors.pink,
      Colors.orange,
    ];

    refData.once().then((DataSnapshot d) {
      var maps = d.value;

    // todo add an online image url to each image
      for (var map in maps)
      {
        var tmpMap = Map<String, dynamic>.from(map);
        setState(() {
          persons.add(SmashBrosPerson.fromJson(tmpMap));
        });
      }

      // persons.forEach((element) {
      //   print(element);
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: widget.myDrawer,
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: persons.length,
          itemBuilder: (_, int index)
          {
            SmashBrosPerson p = persons[index];

            return Container(
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.blueAccent),
              // ),
              padding: EdgeInsets.all(18.0),
              color: colorOptions[r.nextInt(colorOptions.length - 1)],
              child: Center(
                  child: Column(
                children: [
                  // TODO add a picture
                  ListTile(
                    title: Text(
                      p.name,
                      style: TextStyle(fontSize: 25.0),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              // we have to pass each person information
                              // into this widget, so that we can display
                              // its information in a separate page
                              SmashBrosCardDetails(person: p)),
                    ),
                  ),
                ],
              )),
            );
          }),
    );
  }
}
