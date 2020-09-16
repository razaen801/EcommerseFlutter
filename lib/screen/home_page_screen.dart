import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/user_provider.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return SafeArea(
      child: Scaffold(
        body: Text(user.userName),
      ),
    );
  }
}
