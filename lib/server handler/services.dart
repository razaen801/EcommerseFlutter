import 'dart:io';

import 'package:http/http.dart' as http;
import 'product_server.dart';

class Services {
  static const String url = 'https://rohiinternational.com.np/api/v3/products';
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
}
