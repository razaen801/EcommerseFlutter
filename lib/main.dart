import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/widgets/user_detail_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserDetailView(),
    );
  }
}
