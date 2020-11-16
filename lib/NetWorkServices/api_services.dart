import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/SmashBrosPerson.dart';

class APIServices
{
  static final String smashBrosUrl = 'https://localhost:5001/api/SmashBrosPeople/';

  // Retrieves the data from the backend, so that
  // our list will be populated with that information
  // to display onto the app
  // make as get request on the url
  static Future<List<SmashBrosPerson>> fetchSmashBrosPersonList() async
  {
    http.Response res = await http.get(smashBrosUrl);

    if (res.statusCode == 200)
    {
      List<dynamic> body = jsonDecode(res.body);

      List<SmashBrosPerson> persons = body
          .map((dynamic item) => SmashBrosPerson.fromJson(item))
          .toList();

      return persons;
    }
    else
    {
      throw "Can't get posts.";
    }

  }
}

