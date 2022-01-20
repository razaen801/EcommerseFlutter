import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/SharedPreferencesConfig.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/favourites_provider.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeId = "/product_detail_view";
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

void showToastMessage(String s) {
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.blue,
      backgroundColor: Colors.white);
}

class _ProductDetailsState extends State<ProductDetailScreen> {

  bool isLoggedin = false;

  Future checkLog() async{
    bool result = await SharedPreferenceConfig.getIsLoggedIn();
    setState(() {
      isLoggedin = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkLog();
    int productId = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    final favouriteProduct =
        Provider.of<FavouriteProductsProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 93, 92, 1),
        title: Text(product.productName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Product Image Display
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  child: CachedNetworkImage(
                    imageUrl: "https://rohiint.com${product.imageName}",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                //Product price
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. ${product.retailerPrice}",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: product.isFavourite
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                if (product.toggleIsFavourite()) {
                                  showToastMessage("Added to favourite");
                                  favouriteProduct
                                      .addFavouriteProduct(product.id);

                                  return;
                                } else {
                                  showToastMessage("Removed from favourite");

                                  favouriteProduct
                                      .removeFavouriteProduct(product.id);
                                  return;
                                }
                              });
                            },
                            iconSize: 28,
                            color: Colors.red,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Product Description
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 7.0),
            height: 55.0,
            color: Color.fromRGBO(77, 93, 92, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  onPressed: () {
                    if(isLoggedin) {
                      cart.addToCart(product.id.toString(), product.productName,
                          double.parse(product.retailerPrice),
                          product.imageName);
                      showToastMessage("Added to cart");
                    }
                    else showToastMessage("Please login to continue");
                  },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Color.fromRGBO(77, 93, 92, 1),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showToastMessage(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.blue,
        backgroundColor: Colors.white);
  }
}
