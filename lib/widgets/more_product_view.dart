import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/product.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';

class MoreProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvide = Provider.of<ProductProvider>(context, listen: false);
    // final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    List<Product> loadedProduct = productProvide.products;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "\"Just For You\"",
            style:
                TextStyle(fontSize: 20, color: Color.fromRGBO(77, 92, 93, 1)),
          ),
        ),
        Divider(
          color: Color.fromRGBO(77, 92, 93, 1),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: loadedProduct.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 2),
                  child: Container(
                    padding: EdgeInsets.only(top: 2.0),
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(77, 92, 93, 1))),
                    child: Column(
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Image.asset(
                              loadedProduct[i].productImgUrl,
                            )),
                        Text(
                          loadedProduct[i].productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(77, 93, 92, 1),
                              fontSize: 18),
                        ),
                        Text(
                          "Rs. ${loadedProduct[i].productPrice.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(77, 93, 92, 1),
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
