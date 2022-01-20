import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/SharedPreferencesConfig.dart';
import 'package:rohi_furniture_app/provider/message_from_server.dart';
import 'package:rohi_furniture_app/provider/user.dart';
import 'package:rohi_furniture_app/provider/user_provider.dart';
import 'package:rohi_furniture_app/server%20handler/user_login_details.dart';
import 'package:rohi_furniture_app/server%20handler/user_server.dart';
import 'product_server.dart';

class Services {
  static const String url = 'https://www.rohiint.com/api/v3/products';

  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Product> products = productFromJson(response.body);
        return products;
      } else {
        throw HttpException("Could not load data");
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<Media> getProductImage(int id) async {
   final String ImageUrl = 'https://www.rohiint.com/product/image/${id.toString()}';
    try {
      final response = await http.get(ImageUrl);
      if (response.statusCode == 200) {
        return MediaFromJson(response.body).first;
      } else {
        throw HttpException("Could not load data");
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponseMain> getProductsNew(String category_id, String subcategory_id,
      String min, String max, int page) async {
    try {
      Map<String, String> queryParams = {
        'category_id': category_id,
        'subcategory_id': subcategory_id,
        'min': min,
        'max': max,
        'page': page.toString()
      };
      var productUrl = 'https://www.rohiint.com/product/app/get';
      String queryString = Uri(queryParameters: queryParams).query;

      var requestUrl = productUrl +'?'+queryString;
      final response = await http.get(requestUrl);
      if (response.statusCode == 200) {
        final ProductResponseMain productResponseMain = ProductResponseMain.fromJson(jsonDecode(response.body));
        // final List<ProductResponseMain> productResponseMain = productAllFromJson(response.body);
        return productResponseMain;
        // final List<Product> products = productFromJson(response.body);
        // return products;
      } else {
        throw HttpException("Could not load data");
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<void> checkOutOrder(double subTotal) async {
    final url = "https://www.rohiint.com/api/v3/createorder";
    try {
      final response = await http.post(url, body: {
        'user_id': 1,
        'total': subTotal,
        'delivered': 0,
        'payment_type': 1
        // 'product_id': productId,
        // 'order_id': userId,
        // 'qty': quantity,
        // 'color': color,
        // 'size': size,
        // 'total': subTotal
      });
      if (response.statusCode == 200) {
        print(response.statusCode);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  //user signUp
  static Future<void> userSignUp(
      String name, String email, String password) async {
    final url = "https://www.rohiint.com/api/v3/createuser";
    try {
      final response = await http.post(url,
          body: {'name': name, 'email': email, 'password': password});
      if (response.statusCode == 200) {
        print(response);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  //user signUp
  static Future<String> userSignUpNew(
      String name, String email, String password) async {
    final url = "https://www.rohiint.com/registerapp";
    try {
      final response = await http.post(url,
          body: {'name': name, 'email': email, 'password': password,"password_confirmation":password});
      if (response.statusCode == 200) {
        // return MessageFromServer('message', response.body);
        try {
          return jsonDecode(response.body)['message'];
        } catch (e) {
          return 'We sent you an activation code. Check your email and click on the link to verify';
          print(e);
        }
        // return MessageResponse.fromSuccessJson(jsonDecode(response.body)).message;
        print(response);
      } else if(response.statusCode==400) {
        // return MessageFromServer('message', response.body);
        return MessageResponse.fromJson('errors', jsonDecode(response.body)).message.toString();
        // return MessageResponse.fromJson('errors', jsonDecode(response.body)).message;
        print(response.statusCode);
      }
      else{
        throw HttpException("Could not proceed");
      }
    } catch (e) {
      throw e;
    }
  }

  //contact Us
  static Future<void> contactUs() async {
    final url = "https://www.rohiint.com/api/v3/contactus";
    try {
      final response = await http.post(url, body: {
        'sender_name': "kushal",
        'sender_email': "abc@gmail.com",
        'subject': "dasjdhkajs",
        'message': "kjasdhkjsabndkjabskj"
      });
      if (response.statusCode == 200) {
        print(response.statusCode);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
  }

  //Career
  static Future<void> careerRequest(
      {String applicantName,
      String applicantEmail,
      String applicantAddress,
      String applicantGender,
      String applicantPhone,
      String appliedPost,
      String applicantExperience,
      String applicantMessage}) async {
    final url = "https://www.rohiint.com/api/v3/applyjob";
    try {
      final response = await http.post(url, body: {
        'applicants_name': applicantName,
        'applicants_email': applicantEmail,
        'applicants_address': applicantAddress,
        'gender': applicantGender,
        'phone_number': applicantPhone,
        'applied_post': appliedPost,
        'experience': applicantExperience,
        'message': applicantMessage
      });
      if (response.statusCode == 200) {
        print(response.statusCode);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw e;
    }
    print("submitted");
  }

  //Login
  static Future<bool> loginRequest(
      String email, String password, context) async {
    bool result = false;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final url = "https://www.rohiint.com/api/v3/checkuser";
    print("requested");
    try {
      final response =
          await http.post(url, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final List<UserServer> userServer = userServerFromJson(response.body);
        userProvider.addUser(User(
          userName: userServer[0].name,
          userEmail: userServer[0].email,
        ));
        await userProvider.saveUserToDB();
        result = true;
        // loadUser()
      } else {
        throw HttpException("Could not load data");
      }
    } catch (e) {
      throw e;
    }
    return result;
  }

  //Login
  static Future<bool> newLoginRequest(
      String email, String password, context) async {
    bool result = false;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final url = "https://www.rohiint.com/app/login";
    print("requested");
    try {
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$email:$password'));
      print(basicAuth);
      final response = await http
          .post(url, headers: <String, String>{'Authorization': basicAuth});
      if (response.statusCode == 200) {
        // UserLoginDetails userLoginDetails =
        //     UserLoginDetails.fromJson(jsonDecode(response.body));

        await SharedPreferenceConfig.saveUserDetails(response.body);
        await SharedPreferenceConfig.setIsLoggedIn(true);

        // final List<UserLoginDetails> userServer = userDetailsFromJson(response.body);
        // userProvider.addUser(User(
        //   userID: userLoginDetails.id.toString(),
        //   userName: userLoginDetails.name,
        //   userEmail: userLoginDetails.email,
        // ));
        // await userProvider.saveUserToDB();
        
        result = true;
        return result;
        // loadUser()
      } else {
        return false;
        throw HttpException("Could not load data");
      }
    } catch (e) {
      throw e;
      return false;
    }
    return false;
  }
}
