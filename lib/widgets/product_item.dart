import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/carpet.jpg",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Rs. ${product.productPrice.toString()}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ));
  }
}
