import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeId = "/product_detail_view";
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailScreen> {
  // int _counter = 0;
  // double _price = 0;
  //
  // void setTotalPrice(double price) {
  //   setState(() {
  //     _price = price * _counter;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 93, 92, 1),
        title: Text(product.productName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Product Image Display
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 300,
                  width: double.infinity,
                  child: Image.asset("assets/carpet.jpg"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                //Product price
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. ${product.productPrice}",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: product.isFavourite
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                product.toggleIsFavourite();
                              });
                            },
                            iconSize: 32,
                            color: Colors.red,
                          ),
                        ],
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     FlatButton(
                      //       onPressed: () {
                      //         if (_counter > 0) {
                      //           setState(() {
                      //             _counter--;
                      //             setTotalPrice(price);
                      //           });
                      //         }
                      //       },
                      //       child: Icon(Icons.remove),
                      //     ),
                      //     //Number of items
                      //     Text(
                      //       "$_counter",
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //     FlatButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           _counter++;
                      //           setTotalPrice(price);
                      //         });
                      //       },
                      //       child: Icon(Icons.add),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    product.productDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          //Product Description
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 7.0),
            height: 55.0,
            color: Color.fromRGBO(77, 93, 92, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text("Total: $_price",
                //     style: TextStyle(
                //         fontSize: 22.0,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white)),
                RaisedButton(
                  onPressed: () {
                    cart.addToCart(product.productId, product.productName,
                        product.productPrice);
                  },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(77, 93, 92, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
