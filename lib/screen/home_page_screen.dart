import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/screen/about_us_screen.dart';
import 'package:rohi_furniture_app/screen/career_view_screen.dart';
import 'package:rohi_furniture_app/screen/contact_us_screen.dart';
import 'package:rohi_furniture_app/screen/product_grid_view_screen.dart';
import 'package:rohi_furniture_app/screen/user_detail_screen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int pageIndex = 2;

  //create all pages
  final UserDetailScreen _userDetailScreen = new UserDetailScreen();
  final AboutUsScreen _aboutUsScreen = new AboutUsScreen();
  final ProductGridViewScreen _productGridViewScreen =
      new ProductGridViewScreen();
  final CareerViewScreen _careerViewScreen = new CareerViewScreen();
  final ContactUsScreen _contactUsScreen = new ContactUsScreen();

  Widget _showPage = new ProductGridViewScreen();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _userDetailScreen;
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
