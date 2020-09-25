import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/product.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';

class MoreProductView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final productProvide = Provider.of<ProductProvider>(context, listen: false);
   // final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    List<Product> loadedProduct= productProvide.products;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Center(
              child: Text("Just For you!",
              style: TextStyle(fontSize: 20,
          color: Colors.red),)),
        ),

        Container(
          height: MediaQuery.of(context).size.height*0.40,
          child: Padding(
            padding: const EdgeInsets.only(left:10.0, right: 10.0),
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: loadedProduct.length,
            itemBuilder: (context,i){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.45,
                  child: Column(
                  children: [
                    Text(loadedProduct[i].productName),
                    FlatButton(
                        onPressed: (){

                        },
                        child: Image.asset(loadedProduct[i].productImgUrl,)),
                    Row(
                      children: [
                        Text(loadedProduct[i].productPrice.toString()),

                        IconButton(
                            onPressed: (){
                                 // cart.addToCart(product.productId, product.productName,
                                 //     product.productPrice, product.productImgUrl);
                            },
                          icon: Icon(Icons.shopping_cart)) ,
                      ],
                    ),
                    ],
                  ),
                ),
              );
            },
            ),
          ),
          ),
      ],
    );
  }

}