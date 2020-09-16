import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String productName, productId, productDescription;
  double productPrice;
  Product(
      {this.productName,
      this.productId,
      this.productPrice,
      this.productDescription});
}
