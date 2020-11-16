import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_smash_bros_cards/SmashBros/SmashBrosCardDetails.dart';
import 'Models/SmashBrosPerson.dart';
import 'NetWorkServices/api_services.dart';

class SmashBrosPersons extends StatefulWidget {
  final String title;
  Drawer myDrawer;

  // add a constructor
  SmashBrosPersons({Key key, this.title, @required this.myDrawer}) : super(key: key);

  @override
  _SmashBrosPersonsState createState() => _SmashBrosPersonsState();
}

class _SmashBrosPersonsState extends State<SmashBrosPersons> {
  Random r;
  List<Color> colorOptions;

  @override
  void initState() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: widget.myDrawer,
      body: SafeArea(
        child: FutureBuilder(
          future: APIServices.fetchSmashBrosPersonList(),
          builder:
              (BuildContext c, AsyncSnapshot<List<SmashBrosPerson>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            List<SmashBrosPerson> smashBrosPersons = snapshot.data;
            smashBrosPersons.forEach((e) => print(e));

            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: smashBrosPersons.length,
                itemBuilder: (BuildContext c, int index) {
                  SmashBrosPerson p = smashBrosPersons[index];

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
                });
          },
        ),
      ),
    );
  }
}
