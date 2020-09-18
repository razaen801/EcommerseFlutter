import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rohi_furniture_app/widgets/app_drawer.dart';
import 'package:rohi_furniture_app/widgets/product_grid_view.dart';

enum FilterOptions { Favourites, All }

// ignore: must_be_immutable
class ProductGridViewScreen extends StatefulWidget {
  @override
  _ProductGridViewScreenState createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  bool _showFavourites = false;
  String category = "all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  //show fav
                  _showFavourites = true;
                } else {
                  //show not fav
                  _showFavourites = false;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Show Favourites"),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(child: Text("Show All"), value: FilterOptions.All),
            ],
          ),
        ],
        backgroundColor: Color.fromRGBO(77, 93, 92, 1),
        title: Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductGridView(
          isShowFavourite: _showFavourites,
          category: category,
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
