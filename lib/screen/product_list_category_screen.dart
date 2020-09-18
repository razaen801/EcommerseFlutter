import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/widgets/product_grid_view.dart';

// ignore: must_be_immutable
class ProductListCategoryScreen extends StatelessWidget {
  static const String routeId = "/product_list_category_screen";
  String categoryGet;

  ProductListCategoryScreen(this.categoryGet);

  @override
  Widget build(BuildContext context) {
    final category = categoryGet;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 93, 92, 1),
        title: Text(category),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ProductGridView(
          isShowFavourite: false,
          category: category,
        ),
      ),
    ));
  }
}
