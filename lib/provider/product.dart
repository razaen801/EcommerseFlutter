import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String productName, productId, productDescription;
  double productPrice;
  String productCategory;
  bool isFavourite;

  Product(
      {this.productName,
      this.productId,
      this.productPrice,
      this.productDescription,
      this.productCategory,
      this.isFavourite = false});

  void toggleIsFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
