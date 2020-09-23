import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart' show Cart;
import 'package:rohi_furniture_app/widgets/cart_item.dart' as CI;


class CartView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final cartProductProvide = Provider.of<Cart>(context);
   return cartProductProvide.items.isEmpty
       ? Center(
              child: Text("No Products!"),
         )
       : ListView.builder(
              itemCount: cartProductProvide.items.length,
              itemBuilder: (ctx, i) {
                return CI.CartProductItem(productId: cartProductProvide.items.values.toList()[i].id,
                  imageUrl:cartProductProvide.items.values.toList()[i].imgUrl,
                  price:cartProductProvide.items.values.toList()[i].price,
                  quantity: cartProductProvide.items.values.toList()[i].quantity,
                  title: cartProductProvide.items.values.toList()[i].title,);
              }
   );
  }
}