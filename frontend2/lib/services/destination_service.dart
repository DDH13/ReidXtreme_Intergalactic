import 'dart:convert';
import '../models/destination.dart';
import '../utils/routes.dart';
import 'package:http/http.dart' as http;

class DestinationService {
  static Future<Destination> getDestination(String id) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Destination/$id")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return Destination.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to find destination');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Destination>> getDestinations() async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Destination")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Destination> destinations = [];
        for (var destination in json.decode(response.body)) {
          destinations.add(Destination.fromJson(destination));
        }
        return destinations;
      } else {
        throw Exception('Failed to find destinations');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<String>> getDestinationDocks(String id) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Destination/docks/$id")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<String> docks = [];
        for (var dock in json.decode(response.body)) {
          docks.add(dock);
        }
        return docks;
      } else {
        throw Exception('Failed to find docks');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
