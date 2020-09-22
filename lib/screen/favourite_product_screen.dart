import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/widgets/product_grid_view.dart';

class FavouriteProductScreen extends StatelessWidget {
  static const String routeId = "/favourite_product_screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 93, 92, 1),
        title: Text("Favourites"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ProductGridView(
          isShowFavourite: true,
        ),
      ),
    ));
  }
}
