// ignore_for_file: depend_on_referenced_packages

import 'package:shared_preferences/shared_preferences.dart';

class HelperFuctions {
  //key
  static late SharedPreferences sf;
  static String usernameKey = "USERNAMEKEY";
  // static String userLoggedInKey = "LOGGEDINKEY";

  //getting from the shared Prefrence
  static Future init() async {
    sf = await SharedPreferences.getInstance();
    usernameKey = sf.getString("Username") ?? "";
    // userLoggedInKey = sf.getString("Login")!;
  }

  // saving to the shared prefrence
  static Future setusername(String username) async {
    await sf.setString('Username', username);
  }

  // static Future setLogin(String login) async {
  //   await sf.setString('Login', login);
  // }

  static getUsername() => usernameKey;
  // static getlogin() => userLoggedInKey;
}
