import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:rohi_furniture_app/screen/career_screen.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';
import 'package:rohi_furniture_app/widgets/user_detail_view.dart';
=======
>>>>>>> 647d8e2e8536b03c37b61c17b501cf15408736cb
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/provider/user_provider.dart';
import 'package:rohi_furniture_app/screen/home_page_screen.dart';
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
      ],
      child: MaterialApp(
        home: HomePageScreen(),
        routes: {
          ProductListCategoryScreen.routeId: (context) =>
              ProductListCategoryScreen("all"),
        },
      ),
    );
  }
}
