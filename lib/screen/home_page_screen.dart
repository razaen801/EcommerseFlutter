import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/SharedPreferencesConfig.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/screen/about_us_screen.dart';
import 'package:rohi_furniture_app/screen/career_view_screen.dart';
import 'package:rohi_furniture_app/screen/contact_us_screen.dart';
import 'package:rohi_furniture_app/screen/login_screen.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';
import 'package:rohi_furniture_app/screen/product_grid_view_screen.dart';
import 'package:rohi_furniture_app/screen/product_list_category_screen.dart';
import 'package:rohi_furniture_app/screen/purchase_history_screen.dart';
import 'package:rohi_furniture_app/screen/user_detail_screen.dart';
import 'package:rohi_furniture_app/server%20handler/user_login_details.dart';

import 'cart_list_screen.dart';
import 'favourite_product_screen.dart';
import 'order_now_screen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

getLoggingStatus() async {
  await SharedPreferenceConfig.getIsLoggedIn();
}

class _HomePageScreenState extends State<HomePageScreen> {
  //create all pages

  final UserDetailScreen _userDetailScreen = new UserDetailScreen();
  final LoginScreen _loginScreen = new LoginScreen();
  final AboutUsScreen _aboutUsScreen = new AboutUsScreen();
  final ProductGridViewScreen _productGridViewScreen =
      new ProductGridViewScreen();
  final CareerViewScreen _careerViewScreen = new CareerViewScreen();
  final ContactUsScreen _contactUsScreen = new ContactUsScreen();

  Widget _showPage = new ProductGridViewScreen();

  Future<bool> checkLoginValue() async {
    return await SharedPreferenceConfig.getIsLoggedIn() ?? false;
  }

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
      // return _userDetailScreen;

        // Navigator(
        //   key: const ValueKey<String>('Navigator2'),
        // )  

        return MaterialApp(
        //   onGenerateRoute: (_) =>
        //   MaterialPageRoute(builder: (_) => ),
          initialRoute: '/',
          routes: {
            // '/': (context) => new LoginScreen(),
            '/second': (context) => new UserDetailScreen(),
            '/': (context) => FutureBuilder<bool>(
                  future: checkLoginValue(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.data ?? false) {
                      return new UserDetailScreen();
                    } else
                      return new LoginScreen();
                  },
                ),
            // ProductListCategoryScreen.routeId: (context) =>
            //     ProductListCategoryScreen("All Products", 100),
            // ProductDetailScreen.routeId: (context) =>
            //     ProductDetailScreen(),
            FavouriteProductScreen.routeId: (context) =>
                FavouriteProductScreen(),
            CartListScreen.routeId: (context) => CartListScreen(), 
            PurchaseHistoryScreen.routeId: (context) =>
                PurchaseHistoryScreen(),
            // OrderNowScreen.routeId: (context) => OrderNowScreen(),
          },
        );
        break;
      case 1:
        return _aboutUsScreen;
        break;
      case 2:
        return _productGridViewScreen;
        break;
      case 3:
        return _careerViewScreen;
        break;
      case 4:
        return _contactUsScreen;
        break;
      default:
        return new Container(
          child: Center(
            child: Text(
              "Page not found",
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.loadFromCart();
    int pageIndex = 2;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: _showPage,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          color: Color.fromRGBO(77, 93, 92, 1),
          backgroundColor: Colors.white,
          buttonBackgroundColor: Color.fromRGBO(77, 93, 92, 1),
          height: 50,
          items: [
            Icon(
              Icons.verified_user,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.info,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.work,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.perm_contact_calendar,
              size: 25,
              color: Colors.white,
            ),
          ],
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.bounceInOut,
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
      ),
    );
  }
}
