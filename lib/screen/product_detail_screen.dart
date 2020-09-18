import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductName"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Image Display
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset("name"),
            ),
            SizedBox(
              height: 15.0,
            ),
            //Product price
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Price",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      FlatButton(
                        onPressed: () {
                          if (_counter > 0) {
                            setState(() {
                              _counter--;
                            });
                          }
                        },
                        child: Icon(Icons.remove),
                      ),
                      //Number of items
                      Text(
                        "$_counter",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _counter++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            //Product Description
            Text(
              "Description of the product",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 158.0,
            ),
            Container(
              height: 50.0,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:Price",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("ADD TO CART"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
