import 'dart:convert';
import '../utils/routes.dart';
import 'package:http/http.dart' as http;
import 'local_service.dart';

class UserService {

  static Future<bool> login(username, password) async {
    Map<String, dynamic> data = {
      'username': username,
      'password': password
    };

    String body = json.encode(data);

    try {
      // send a post request to the API endpoint
      var response = await http.post(
        Uri.parse(getRoute("User/login")),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        LocalService.setJWT(json.decode(response.body));
        LocalService.setCurrentUserName(username);
        LocalService.setCurrentUserId("64aa7bcddd01ede8be01ca6c");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

}