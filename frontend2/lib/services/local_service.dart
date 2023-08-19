import '../utils/shared_preferences.dart';

class LocalService{
  static void setCurrentUserId(String id){
    SharedPref.setString('currentUserId', id);
  }
  static Future<String> getCurrentUserId() async{
    return SharedPref.getString('currentUserId');
  }

  static void setCurrentUserName(String name){
    SharedPref.setString('currentUserName', name);
  }

  static Future<String> getCurrentUserName() async{
    return SharedPref.getString('currentUserName');
  }

  static void setJWT(String jwt){
    SharedPref.setString('JWT', jwt);
  }

  static Future<String> getJWT() async{
    return SharedPref.getString('JWT');
  }
}