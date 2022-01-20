
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:rohi_furniture_app/server%20handler/product_server.dart';

import 'SharedPreferencesConfig.dart';

class Utility{

  static final String imageBaseUrl ='https://rohiint.com';

  String getFullUrlFromMedia(Media media){
    return 'https://www.rohiint.com/media/${media.id}/${media.fileName}';
  }

  Future<bool> checkLoginValue() async {
    return await SharedPreferenceConfig.getIsLoggedIn() ?? false;
  }

  static Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Mobile data detected & internet connection confirmed.
        return true;
      } else {
        // Mobile data detected but no internet connection found.
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Wifi detected & internet connection confirmed.
        return true;
      } else {
        // Wifi detected but no internet connection found.
        return false;
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      return false;
    }
  }
}