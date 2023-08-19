import 'dart:convert';
import '../models/booking.dart';
import '../utils/routes.dart';
import 'package:http/http.dart' as http;

class BookingService {
  Future<Booking> getBooking(String id) async {
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

  Future<List<Booking>> findUserBooking(String userId) async {
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

  Future<void> deleteBooking(String id) async {
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

  Future<void> updateBooking(String key, dynamic value, String id) async {
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
}
