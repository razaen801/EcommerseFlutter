import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/product.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/widgets/product_item.dart';

// ignore: must_be_immutable
class ProductGridView extends StatelessWidget {
  final bool isShowFavourite;
  String category;

  ProductGridView({this.isShowFavourite, this.category});

  @override
  Widget build(BuildContext context) {
    final productProvide = Provider.of<ProductProvider>(context, listen: false);
    List<Product> loadedProduct;

    if (category == "all") {
      loadedProduct =
          isShowFavourite ? productProvide.favourites : productProvide.products;
    } else {
      loadedProduct = isShowFavourite
          ? productProvide.favourites
          : productProvide.findByCategory(category);
    }

    return loadedProduct.isEmpty
        ? Center(
            child: Text("No Products!"),
          )
        : GridView.builder(
            itemCount: loadedProduct.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 4),
            itemBuilder: (ctx, i) {
              return ChangeNotifierProvider.value(
                value: loadedProduct[i],
                child: ProductItem(),
              );
            });
  }
}
