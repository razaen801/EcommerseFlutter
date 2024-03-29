import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/SharedPreferencesConfig.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';
import 'package:rohi_furniture_app/server%20handler/product_server.dart';
import 'package:rohi_furniture_app/server%20handler/services.dart';

import '../uitlities.dart';

class ProductItem extends StatelessWidget {
  bool isLoggedIn = false;

  Future checkLogin() async{
    isLoggedIn = await SharedPreferenceConfig.getIsLoggedIn();
  }
  Widget build(BuildContext context) {
    checkLogin();
    final product = Provider.of<LocalProduct>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.routeId,
            arguments: product.id);
      },
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 175,
                child: FittedBox(
                    child: !product.isImageLoaded ?
                    FutureBuilder(
                  future: getImageUrl(product),
                  builder: (ctx, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: new CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                        )
                        : CachedNetworkImage(
                            imageUrl: "${Utility.imageBaseUrl}${snapshot.data}",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                            errorWidget: (context, url, error) => Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Icon(Icons.error),
                            ),
                          );
                  },
                ):
                    CachedNetworkImage(
                      imageUrl: "${Utility.imageBaseUrl}${product.imageName}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                      errorWidget: (context, url, error) => Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Icon(Icons.error),
                      ),
                    ),
                    ),
              ),
              // Image.asset(product.imageName),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          product.productName.length < 10
                              ? product.productName
                              : "${product.productName.substring(0, 9)}...",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        "Rs. ${product.retailerPrice.toString()}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      if(isLoggedIn){
                        cart.addToCart(
                            product.id.toString(),
                            product.productName,
                            double.parse(product.retailerPrice),
                            product.imageName);
                        showToastMessage("Added to cart");
                      }
                      else{
                        showToastMessage("Please login to add to cart");
                      }


                    },
                  ),
                ],
              )
            ],
          )),
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

  Future<String> getImageUrl(LocalProduct product) async {
    // Media media;
    Media media = await Services.getProductImage(product.id);
    product.isImageLoaded= true;
    product.imageName = '/media/${media.id}/${media.fileName}';


    // media = (await Services.getProductImage(id)) as Media;
     return '/media/${media.id}/${media.fileName}';
  }
}
