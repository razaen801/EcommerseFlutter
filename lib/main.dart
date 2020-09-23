import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/screen/about_us_screen.dart';
import 'package:rohi_furniture_app/screen/career_screen.dart';
import 'package:rohi_furniture_app/screen/login_screen.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';
import 'package:rohi_furniture_app/screen/sign_up_screen.dart';
import 'package:rohi_furniture_app/widgets/user_detail_view.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/provider/user_provider.dart';
import 'package:rohi_furniture_app/screen/favourite_product_screen.dart';
import 'package:rohi_furniture_app/screen/home_page_screen.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';
import 'package:rohi_furniture_app/screen/product_list_category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
       providers: [
         ChangeNotifierProvider.value(value: UserProvider()),
         ChangeNotifierProvider.value(value: ProductProvider()),
    ChangeNotifierProvider.value(value: Cart()),
       ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         home: HomePageScreen(),
         routes: {
           ProductListCategoryScreen.routeId: (context) =>
               ProductListCategoryScreen("all"),
           ProductDetailScreen.routeId: (context) => ProductDetailScreen(),
          FavouriteProductScreen.routeId: (context) => FavouriteProductScreen(),
         },
       ),
     );
  }
}
