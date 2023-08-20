import 'dart:convert';
import '../models/booking.dart';
import '../utils/routes.dart';
import 'package:http/http.dart' as http;

class BookingService {
  static Future<Booking> getBooking(String id) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Booking/$id")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return Booking.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to find booking');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Booking>> findUserBooking(String userId) async {
    try {
      var response = await http.get(
        Uri.parse(getRoute("Booking/user/$userId")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<Booking> bookings = [];
        for (var booking in json.decode(response.body)) {
          bookings.add(Booking.fromJson(booking));
        }
        return bookings;
      } else {
        throw Exception('Failed to find bookings');
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<void> deleteBooking(String id) async {
    try {
      var response = await http.delete(
        Uri.parse(getRoute("Booking/$id")),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  //Call this -> updateBooking("status", "cancelled", "64df73fa7bbda70fb14c5289");
  static Future<void> updateBooking(String key, dynamic value, String id) async {
    try {
      var response = await http.patch(
        Uri.parse(getRoute("Booking/$id")),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode([
          {"op": "replace", "path": "/$key", "value": value}
        ]),
      );

      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  static Future<void> createBooking(Booking booking) async {
    try {
      print(Booking.toJson(booking));
      var response = await http.post(
        Uri.parse(getRoute("Booking/add")),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(Booking.toJson(booking)),
      );

      if (response.statusCode == 204) {
        print(response.body);
        return;
      }
      else {
        print(response.body);
        throw Exception('Failed to create booking');
      }
    } catch (e) {
      print(e);
      throw Exception('Something went wrong');
    }
  }
}
