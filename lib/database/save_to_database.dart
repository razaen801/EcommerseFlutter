import 'dart:async';

import 'package:rohi_furniture_app/database/productDB.dart';
import 'package:rohi_furniture_app/server%20handler/product_server.dart';
import 'package:rohi_furniture_app/server%20handler/services.dart';
import 'package:rohi_furniture_app/uitlities.dart';

import 'database.dart';

class SaveToDB {
  loadProductsToDB() async {
    print("loadtoDbrequested...");
    final database = await $FloorAppDatabase.databaseBuilder('Product').build();
    final productDao = database.productDao;
    int current_page =1;
    bool isNetworkConnected = await Utility.isInternet();


    try {
      final List<ProductDB> productFromDB = await productDao.findAllProducts();
      // List<Product> productFromServer = await Services.getProducts();

      if(isNetworkConnected){
      List<Product> productFromServer =[];
      print('requesting from server page $current_page');
      ProductResponseMain productResponses= await Services.getProductsNew("", "", "", "",1);
      print("total pages: ${productResponses.lastPage}");
      productFromServer.addAll(productResponses.products);
      print('added to list page $current_page');

      if(current_page!=productResponses.lastPage){
        current_page++;
        for(var i=current_page; i <=productResponses.lastPage; i++){
          print('requesting from server page $i');

          ProductResponseMain productResponses =await Services.getProductsNew("", "", "", "",i);
          productFromServer.addAll(productResponses.products);
          print('added to list from server page $i');
        }
      }

      print("total files added: ${productFromServer.length} ");

      try {
        productDao.deleteAllProducts();
        print("all Product deleted");
      } catch (e) {
        print(e);
        print("Product delete error: $e");

      }


      // if (productFromDB.isEmpty) {

        print("Inserting data on empty db ${productFromServer.length}");
        for (int i = 0; i < productFromServer.length; i++) {
          // Media media = await Services.getProductImage(productFromServer[i].id);
          // print("${media.fileName} ${i+1}");
          ProductDB product = ProductDB(
              id: productFromServer[i].id,
              productName: productFromServer[i].productName,
              description: productFromServer[i].description,
              availableColors: productFromServer[i].availableColors,
              availableSizes: productFromServer[i].availableSizes,
              categoryId: productFromServer[i].categoryId,
              dealerPrice: productFromServer[i].dealerPrice,
              enabled: productFromServer[i].enabled,
              inStock: productFromServer[i].enabled,
              retailerPrice: productFromServer[i].retailerPrice,
              subCategoryId: productFromServer[i].subcategoryId,
              imageName: "",

              // imageName: '/media/${media.id}/${media.fileName}',
              // imageName: productFromServer[i].image,
              isFavourite: false);
          await productDao.insertProduct(product);
        }
      }
      // else {
      //   print("Inserting data on non empty ${productFromServer.length}");
      //   for (int i = 0; i < productFromServer.length; i++) {
      //     //check if database is empty
      //     if (productFromDB.isNotEmpty) {
      //       //check if user is present in database
      //       for (int j = 0; j < productFromDB.length; j++) {
      //         if (productFromDB[i].id != productFromServer[i].id) {
      //           // Media media = await Services.getProductImage(productFromServer[i].id);
      //           // print("Inserting data on non empty ${media.fileName}");
      //           final product = ProductDB(
      //               id: productFromServer[i].id,
      //               productName: productFromServer[i].productName,
      //               description: productFromServer[i].description,
      //               availableColors: productFromServer[i].availableColors,
      //               availableSizes: productFromServer[i].availableSizes,
      //               categoryId: productFromServer[i].categoryId,
      //               dealerPrice: productFromServer[i].dealerPrice,
      //               enabled: productFromServer[i].enabled,
      //               inStock: productFromServer[i].enabled,
      //               retailerPrice: productFromServer[i].retailerPrice,
      //               subCategoryId: productFromServer[i].subcategoryId,
      //               imageName: "",
      //               // imageName: productFromServer[i].image,
      //               // imageName: '/media/${media.id}/${media.fileName}',
      //               isFavourite: false);
      //           await productDao.insertProduct(product);
      //         } else {
      //           return;
      //         }
      //       }
      //     }
      //   }
      // }
    } catch (e) {
      print('page: $current_page Error: ${e.toString()}');
      throw e;
    }
  }
}
