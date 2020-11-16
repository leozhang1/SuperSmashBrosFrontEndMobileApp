import 'package:flutter/foundation.dart';

class SmashBrosPerson
{
  final int id;
  final String name;
  final String final_smash;
  final String gender;
  final String appears_in;
  final String console_of_origin;
  final String universe;
  final String species;
  final String home_world;

  SmashBrosPerson(
      { @required this.id,
      @required this.name,
      @required this.final_smash,
      @required this.gender,
      @required this.appears_in,
      @required this.console_of_origin,
      @required this.universe,
      @required this.species,
      @required this.home_world });

  // SmashBrosPerson(this._id, this._name,
  //     this._final_smash, this._gender,
  //     this._appears_in,this._console_of_origin,
  //     this._universe, this._species,this._home_world);

  // getters and setters
  // int get id => _id;
  // String get name => _name;
  // String get finalSmash => _finalSmash;
  // String get gender => _gender;
  // String get appearsIn => _appears_in;
  // String get consoleOfOrigin => _console_of_origin;
  // String get universe => _universe;
  // String get species => _species;
  // String get homeWorld => _home_world;

  // set name(String a) => name = a;
  // set finalSmash(String b) => _final_smash = b;
  // set gender(String c) => gender = c;
  // set appearsIn(String d) => _appears_in = d;
  // set consoleOfOrigin(String e) => _console_of_origin = e;
  // set universe(String f) => _universe = f;
  // set species(String g) => _species = g;
  // set homeWorld(String h) => _home_world = h;

  // make convertable into a json object
  Map<String, dynamic> toMap()
  {
    var m = Map<String, dynamic>();
    m["name"] = name;
    m["final_smash"] = final_smash;
    m["gender"] = gender;
    m["appears_in"] = appears_in;
    m["console_of_origin"] = appears_in;
    m["universe"] = appears_in;
    m["species"] = appears_in;
    m["home_world"] = appears_in;

    if (id != null)
    {
      m["id"] = id;
    }

    return m;
  }

  factory SmashBrosPerson.fromJson(Map<String, dynamic> json)
  {
    return SmashBrosPerson(
        id : json["id"] as int,
        name :json["name"] as String,
        final_smash :  json["final_smash"] as String,
        gender : json["gender"] as String,
        appears_in : json["appears_in"] as String,
        console_of_origin : json["console_of_origin"] as String,
        universe : json["universe"] as String,
        species : json["species"] as String,
        home_world : json["home_world"] as String);
  }

  @override
  String toString()
  {
    var map = toMap();
    map.forEach((k,v) => print('${k.toString()}: ${v.toString()}'));
    return '';
  }
}
