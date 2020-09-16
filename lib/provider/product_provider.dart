import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/provider/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productList = [
    Product(
        productId: "1",
        productDescription: "This is chair",
        productName: "Chair",
        productPrice: 500.0),
    Product(
        productId: "2",
        productDescription: "This is carpet",
        productName: "carpet",
        productPrice: 500.0),
    Product(
        productId: "3",
        productDescription: "This is palwa HB",
        productName: "palwa HB",
        productPrice: 500.0),
    Product(
        productId: "4",
        productDescription: "This is tile",
        productName: "tiles",
        productPrice: 500.0),
  ];

  // return list of all products
  List<Product> get products {
    return [..._productList];
  }

  Product findById(String id) {
    return _productList.firstWhere((prod) {
      return prod.productId == id;
    });
  }
}
