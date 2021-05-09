

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceConfig{
  static String LOGIN_USER_DETAILS='login_user_details';
  static String IS_LOGGED = 'is_logged';


  static saveUserDetails(value) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(LOGIN_USER_DETAILS, value);
  }

  static getUserDetails() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getString(LOGIN_USER_DETAILS);
  }

  static setIsLoggedIn(value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(IS_LOGGED, value);
  }

  static getIsLoggedIn() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(IS_LOGGED);
  }

}