import 'package:flutter/material.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  static const String routeId = "/purchase_history_screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(77, 93, 92, 1),
          title: Text("History"),
        ),
        body: Center(
          child: Text("No purchase history!"),
        ),
      ),
    );
  }
}
