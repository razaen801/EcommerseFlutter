import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/provider/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productList = [
    Product(
        productId: "1",
        productDescription: "This is chair",
        productName: "Chair",
        productPrice: 500.0,
        productCategory: "LUXOR CHAIR"),
    Product(
        productId: "2",
        productDescription: "This is carpet",
        productName: "carpet",
        productPrice: 500.0,
        productCategory: "LUXOR CHAIR"),
    Product(
        productId: "3",
        productDescription: "This is palwa HB",
        productName: "palwa HB",
        productPrice: 500.0,
        productCategory: "LUXOR CHAIR"),
    Product(
        productId: "4",
        productDescription: "This is tile",
        productName: "tiles",
        productPrice: 500.0,
        productCategory: "SUPREME FURNITURE"),
    Product(
        productId: "1",
        productDescription: "This is chair",
        productName: "Chair",
        productPrice: 500.0,
        productCategory: "SUPREME FURNITURE"),
    Product(
        productId: "2",
        productDescription: "This is carpet",
        productName: "carpet",
        productPrice: 500.0,
        productCategory: "SUPREME FURNITURE"),
    Product(
        productId: "3",
        productDescription: "This is palwa HB",
        productName: "palwa HB",
        productPrice: 500.0,
        productCategory: "ART DECO-PVC TILES"),
    Product(
        productId: "4",
        productDescription: "This is tile",
        productName: "tiles",
        productPrice: 500.0,
        productCategory: "ART DECO-PVC TILES"),
    Product(
        productId: "1",
        productDescription: "This is chair",
        productName: "Chair",
        productPrice: 500.0,
        productCategory: "ART DECO-PVC TILES"),
    Product(
        productId: "2",
        productDescription: "This is carpet",
        productName: "carpet",
        productPrice: 500.0,
        productCategory: "FLOOR MAX -LAMINATE"),
    Product(
        productId: "3",
        productDescription: "This is palwa HB",
        productName: "palwa HB",
        productPrice: 500.0,
        productCategory: "DECO FLOOR PVC TILES"),
    Product(
        productId: "4",
        productDescription: "This is tile",
        productName: "tiles",
        productPrice: 500.0,
        productCategory: "GRASSIA- ARTIFICIAL GRASS"),
    Product(
        productId: "1",
        productDescription: "This is chair",
        productName: "Chair",
        productPrice: 500.0,
        productCategory: "PVC FLOORING"),
    Product(
        productId: "2",
        productDescription: "This is carpet",
        productName: "carpet",
        productPrice: 500.0,
        productCategory: "KALEEN RUGS"),
    Product(
        productId: "3",
        productDescription: "This is palwa HB",
        productName: "palwa HB",
        productPrice: 500.0,
        productCategory: "KALEEN RUGS"),
    Product(
        productId: "4",
        productDescription: "This is tile",
        productName: "tiles",
        productPrice: 500.0,
        productCategory: "KALEEN RUGS"),
  ];

  // return list of all products
  List<Product> get products {
    return [..._productList];
  }

  //get product by id
  Product findById(String id) {
    return _productList.firstWhere((prod) {
      return prod.productId == id;
    });
  }

  //get product by category
  List<Product> findByCategory(String category) {
    return _productList.where((prod) {
      return prod.productCategory == category;
    }).toList();
  }

  //get favourite product
  List<Product> get favourites {
    return _productList.where((prodItem) {
      return prodItem.isFavourite;
    }).toList();
  }
}
