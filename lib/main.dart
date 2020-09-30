import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/provider/favourites_provider.dart';
import 'package:rohi_furniture_app/provider/order_provider.dart';
import 'package:rohi_furniture_app/screen/cart_list_screen.dart';
import 'package:rohi_furniture_app/screen/order_now_screen.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/provider/user_provider.dart';
import 'package:rohi_furniture_app/screen/favourite_product_screen.dart';
import 'package:rohi_furniture_app/screen/home_page_screen.dart';
import 'package:rohi_furniture_app/screen/product_list_category_screen.dart';
import 'package:rohi_furniture_app/screen/purchase_history_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<String> loadDataFromServer() async {
    await ProductProvider().getProductFromServer();
    return ("Loaded");
  }

  @override
  Widget build(BuildContext context) {
    loadDataFromServer();
    return FutureBuilder(
      future: loadDataFromServer(),
      builder: (ctx, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? MaterialApp(
                home: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 250, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/logo.jpg",
                          height: 300,
                          width: 350,
                          alignment: Alignment.center,
                        ),
                        Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Loading...",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            : MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: UserProvider()),
                  ChangeNotifierProvider.value(value: ProductProvider()),
                  ChangeNotifierProvider.value(value: Cart()),
                  ChangeNotifierProvider.value(
                      value: FavouriteProductsProvider()),
                  ChangeNotifierProvider.value(value: OrderList()),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: HomePageScreen(),
                  routes: {
                    ProductListCategoryScreen.routeId: (context) =>
                        ProductListCategoryScreen("All Products", 100),
                    ProductDetailScreen.routeId: (context) =>
                        ProductDetailScreen(),
                    FavouriteProductScreen.routeId: (context) =>
                        FavouriteProductScreen(),
                    CartListScreen.routeId: (context) => CartListScreen(),
                    PurchaseHistoryScreen.routeId: (context) =>
                        PurchaseHistoryScreen(),
                    OrderNowScreen.routeId: (context) => OrderNowScreen(),
                  },
                ),
              );
      },
    );
  }
}
