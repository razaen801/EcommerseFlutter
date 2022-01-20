import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/SharedPreferencesConfig.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/user.dart';
import 'package:rohi_furniture_app/provider/user_provider.dart';
import 'package:rohi_furniture_app/screen/cart_list_screen.dart';
import 'package:rohi_furniture_app/screen/favourite_product_screen.dart';
import 'package:rohi_furniture_app/screen/purchase_history_screen.dart';
import 'package:rohi_furniture_app/server%20handler/user_login_details.dart';

import 'badge.dart';

class UserDetailView extends StatelessWidget {

  Future<User> getUserDetails() async {
    UserLoginDetails userLoginDetails =
    UserLoginDetails.fromJson(jsonDecode(await SharedPreferenceConfig.getUserDetails()));
    return new User(userID: userLoginDetails.id.toString(),userName: capitalize(userLoginDetails.name),
    userEmail: userLoginDetails.email,userAddress: 'NA',userPhone: 'NA');
  }

  String capitalize(String input) {
    if (input == null) {
      throw new ArgumentError("string: $input");
    }
    if (input.length == 0) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    User user;

    // final user = Provider.of<UserProvider>(context).user;

    // User user = new User();

    return FutureBuilder(
      future: getUserDetails(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          user = snapshot.data;
        }
       return snapshot.connectionState == ConnectionState.done?
           Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 2.0, left: 20, right: 1, bottom: 20),
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(77, 93, 92, 1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100.0),
                        bottomLeft: Radius.circular(100.0))),
                child: FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //Circle Image
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                  color: Colors.lightBlue,
                                  width: 5.0,
                                )),
                            width: MediaQuery.of(context).size.width * 0.35,
                            margin: EdgeInsets.only(left: 20),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70.0,
                              child: Text(
                                user.userName.characters.first,
                                style: TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                          //UserName
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.55,
                            padding: EdgeInsets.only(right: 30.0, bottom: 50.0),
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              user.userName,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      //Icon List
                      Container(
                        width: MediaQuery.of(context).size.width * .65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.list,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Navigator.of(context,rootNavigator: true);
                                // Navigator.pushNamed(
                                //     context, PurchaseHistoryScreen.routeId);
                                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                                  return new PurchaseHistoryScreen();
                                },
                                  fullscreenDialog: true
                                ));
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => PurchaseHistoryScreen()));
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                // Navigator.pushNamed(
                                //     context, FavouriteProductScreen.routeId);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FavouriteProductScreen()));
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                            Consumer<Cart>(
                              child: IconButton(
                                icon: Icon(Icons.shopping_cart),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartListScreen()));

                                  // Navigator.pushNamed(
                                  //     context, CartListScreen.routeId);
                                },
                              ),
                              builder: (_, cart, child) {
                                return Badge(
                                  child: child,
                                  value: cart.itemCount.toString(),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                onLogOut(context);

                              },
                              icon: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //User Detail
              Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Color.fromRGBO(77, 93, 92, 1),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              user.userPhone,
                              style: TextStyle(
                                color: Color.fromRGBO(77, 93, 92, 1),
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Color.fromRGBO(77, 93, 92, 1),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              user.userEmail,
                              style: TextStyle(
                                color: Color.fromRGBO(77, 93, 92, 1),
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Color.fromRGBO(77, 93, 92, 1),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              user.userAddress,
                              style: TextStyle(
                                color: Color.fromRGBO(77, 93, 92, 1),
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ):
           Center(
             child: SizedBox(
               height: 30,
               width: 30,
               child: new CircularProgressIndicator(
                 strokeWidth: 2.0,
               ),
             ),
           );
      },
    );
  }

  void onLogOut(BuildContext context) async {
    await SharedPreferenceConfig.setIsLoggedIn(false);
    Navigator.pushNamed(context, '/');
  }

}
