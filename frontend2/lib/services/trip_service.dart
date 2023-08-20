import 'dart:convert';
import 'dart:ffi';
import '../models/trip.dart';
import '../utils/routes.dart';
import 'package:http/http.dart' as http;

class TripService {
  static Future<Trip> getTrip(String id) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Trip/$id")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return Trip.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to find trip');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Trip>> findTrip(
      String sourceId, String destId, DateTime departure) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute(
            "Trip/findtrip?source=$sourceId&destination=$destId&departure=$departure")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Trip> trips = [];
        for (var trip in json.decode(response.body)) {
          trips.add(Trip.fromJson(trip));
        }
        return trips;
      } else {
        throw Exception('Failed to find trips');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Trip>> findReturnTrip(
      String sourceId, String destId, DateTime arrival) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute(
            "Trip/findreturntrip?source=$sourceId&destination=$destId&arrival=$arrival")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Trip> trips = [];
        for (var trip in json.decode(response.body)) {
          trips.add(Trip.fromJson(trip));
        }
        return trips;
      } else {
        throw Exception('Failed to find trips');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Trip>> getTripsBySource(String source) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Trip/source?source=$source")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Trip> trips = [];
        for (var trip in json.decode(response.body)) {
          trips.add(Trip.fromJson(trip));
        }
        return trips;
      } else {
        throw Exception('Failed to find trips');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Trip>> getTripsByDestination(String destination) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Trip/destination?destination=$destination")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Trip> trips = [];
        for (var trip in json.decode(response.body)) {
          trips.add(Trip.fromJson(trip));
        }
        return trips;
      } else {
        throw Exception('Failed to find trips');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Trip>> getTripsBySourceAndDestination(
      String source, String destination) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute(
            "Trip/sourcetodest?source=$source&destination=$destination")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Trip> trips = [];
        for (var trip in json.decode(response.body)) {
          trips.add(Trip.fromJson(trip));
        }
        return trips;
      } else {
        throw Exception('Failed to find trips');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Trip>> getTripsByDepartureDate(
      DateTime departure1, DateTime departure2) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute(
            "Trip/departure?departure1=$departure1&departure2=$departure2")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Trip> trips = [];
        for (var trip in json.decode(response.body)) {
          trips.add(Trip.fromJson(trip));
        }
        return trips;
      } else {
        throw Exception('Failed to find trips');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<Double> getCost(String id, int adults, int children) async {
    try {
      var response = await http.get(
        Uri.parse(
            getRoute("Trip/cost?id=$id&adults=$adults&children=$children")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to find cost');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<Double> getDistance(String source, String destination) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Trip/distance/$source/$destination")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to find distance');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
