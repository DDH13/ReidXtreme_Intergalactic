import 'dart:convert';
import '../models/shuttle.dart';
import '../utils/routes.dart';
import 'package:http/http.dart' as http;

class ShuttleService {
  Future<Shuttle> getShuttle(String id) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Shuttle/$id")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return Shuttle.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to find shuttle');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Shuttle>> getShuttles() async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Shuttle")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Shuttle> shuttles = [];
        for (var shuttle in json.decode(response.body)) {
          shuttles.add(Shuttle.fromJson(shuttle));
        }
        return shuttles;
      } else {
        throw Exception('Failed to find shuttles');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
