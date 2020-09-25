import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';


class CartProductItem extends StatefulWidget{
final String  title, productId,imageUrl;
final double price;
final int quantity;

CartProductItem({this.title, this.productId, this.price, this.quantity,this.imageUrl});



  @override
  _CartProductItemState createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  int _counter = 0;
  double _price = 0;
  double _totalPrice=0;

  double setTotalPrice(double price) {
    setState(() {
       _price = price * _counter;
    });
    return _price;
  }

  @override
  Widget build(BuildContext context) {
  final cartItem=Provider.of<Cart>(context);
  _counter=widget.quantity;
  _price = setTotalPrice(widget.price) ;
    return
    //   ListTile(
    //   title: Text(widget.title),
    //   subtitle: Text("${widget.price}"),
    //   leading: Image.asset(widget.imageUrl),
    //   trailing:
    //   FittedBox(
    //     child: Column(
    //       children: [
    //         Text("$_price",style: TextStyle(fontSize: 18),),
    //         Container(
    //           width: 200,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               FlatButton(
    //                 onPressed: () {
    //                 setState(() {
    //                   if (_counter>0) {
    //                     cartItem.removeSingleItemFromCart(widget.productId);
    //                     ChangeNotifierProvider();
    //                   }
    //                 });
    //                 },
    //                 child: Icon(Icons.remove),
    //               ),
    //               //Number of items
    //               Text(
    //                 "$_counter",
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                 ),
    //               ),
    //               FlatButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     cartItem.addToCart(widget.productId, widget.title, widget.price, widget.imageUrl);
    //                     ChangeNotifierProvider();
    //                   });
    //                 },
    //                 child: Icon(Icons.add),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    Container(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FittedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 4.0, right: 180,left: 2.0),
                      child: Image.asset(widget.imageUrl,
                        height: 100,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:4.0, bottom: 8.0, left:5.0,right:150.0),
                      child: Text(widget.title,
                        style: TextStyle(
                          fontSize: 30.0,
                        ),),
                    ),
                  ],
                ),
              ),

              FittedBox(
                child: Column(
                  children: [
                    Text("RS$_price",style: TextStyle(fontSize: 28),),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                if (_counter>0) {
                                  cartItem.removeSingleItemFromCart(widget.productId);
                                  ChangeNotifierProvider();
                                }
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                          //Number of items
                          Text(
                            "$_counter",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                cartItem.addToCart(widget.productId, widget.title, widget.price, widget.imageUrl);
                                ChangeNotifierProvider();
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}