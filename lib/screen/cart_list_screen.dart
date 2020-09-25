import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/widgets/cart_view.dart';




 class CartListScreen extends StatefulWidget{
   static const String routeId = "/cart_list_screen";
  @override
  _CartListScreenState createState() => _CartListScreenState();

 }

class _CartListScreenState extends State<CartListScreen>{
  @override
  Widget build(BuildContext context) {
    final cartProductProvide = Provider.of<Cart>(context);
    final _totalPrice= cartProductProvide.getTotalAmount();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 93, 92, 1),
        title: Text("Your Cart"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child: CartView()
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text("TOTAL PRICE: ",
                      style:TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(77, 92, 93, 1),
                          fontWeight: FontWeight.bold),),
                    Text("RS $_totalPrice",
                      style:TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(77, 92, 93, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                RaisedButton(
                    onPressed: (){

                    },
                    child: Text("ORDER NOW",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(77, 92, 93, 1),
                          fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),

        ],
      ),
      );
  }
}