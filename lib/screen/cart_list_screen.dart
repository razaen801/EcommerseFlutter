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
        children: [
          Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child: CartView()
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: Color.fromRGBO(73, 92, 93, 0.5),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                  child: ListTile(
                    leading: Text("TOTAL PRICE",
                    style:TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(77, 92, 93, 1),
                        fontWeight: FontWeight.bold),),
                      trailing: Text("RS $_totalPrice",
                      style:TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(77, 92, 93, 1),
                          fontWeight: FontWeight.bold),),
                  ),
                 ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0 ,bottom:0.0),
                child: RaisedButton(
                  color: Color.fromRGBO(77, 92, 93, 0.5),
                  onPressed: (){

                  },
                    child: Text("PROCEED TO CHECK OUT",
                        style: TextStyle(
                        fontSize: 20,
                            color: Color.fromRGBO(77, 92, 93, 1),
                        fontWeight: FontWeight.bold),)
                ),
              ),
            ],
          ),
        ],
      ),
      );
  }
}