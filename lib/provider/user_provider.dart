import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/provider/user.dart';

class UserProvider with ChangeNotifier {
  User user = new User(
      userName: "Kushal",
      userID: "1",
      userPhone: "9860168413",
      userAddress: "Balaju",
      userEmail: "kushalshrestha85@gmail.com");
}
