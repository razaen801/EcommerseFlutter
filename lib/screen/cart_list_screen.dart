import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/screen/order_now_screen.dart';
import 'package:rohi_furniture_app/widgets/cart_view.dart';

class CartListScreen extends StatefulWidget {
  static const String routeId = "/cart_list_screen";
  @override
  _CartListScreenState createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProductProvide = Provider.of<Cart>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(77, 93, 92, 1),
          title: Text("Your Cart"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              await cartProductProvide.loadToCartDB();
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: CartView()),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              color: Color.fromRGBO(77, 92, 93, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, OrderNowScreen.routeId);
                      },
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
