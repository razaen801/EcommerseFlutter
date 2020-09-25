import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart' show Cart;
import 'package:rohi_furniture_app/widgets/cart_item.dart' as CI;
import 'package:rohi_furniture_app/widgets/more_product_view.dart';


class CartView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final cartProductProvide = Provider.of<Cart>(context);
   return cartProductProvide.items.isEmpty
       ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
             child: Center(
               child: Text("No Products!",
               style: TextStyle(
                   fontSize: 20,
               ),),
             ),
           ),
           SizedBox(
             child: Divider(
               height: 20,
               color: Colors.white,
             ),
           ),
           MoreProductView(),
         ],
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