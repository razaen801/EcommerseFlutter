import 'package:flutter/material.dart';

class LocalProduct with ChangeNotifier {
  int id, categoryId, subCategoryId, inStock, enabled;
  String productName,
      description,
      dealerPrice,
      retailerPrice,
      availableColors,
      imageName,
      availableSizes;
  bool isFavourite;
  bool isImageLoaded;

  LocalProduct(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.inStock,
      this.productName,
      this.description,
      this.dealerPrice,
      this.retailerPrice,
      this.availableColors,
      this.imageName,
      this.availableSizes,
      this.enabled,
      this.isFavourite,
      this.isImageLoaded});

  bool toggleIsFavourite() {
    isFavourite = !isFavourite;
    return isFavourite;
  }
  bool toogleIsImageLoaded()
  {
    isImageLoaded = !isImageLoaded;
    return isImageLoaded;
  }
}
