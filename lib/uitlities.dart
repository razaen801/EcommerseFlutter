
import 'package:rohi_furniture_app/server%20handler/product_server.dart';

class Utility{

  static final String imageBaseUrl ='https://rohiint.com';

  String getFullUrlFromMedia(Media media){
    return 'https://www.rohiint.com/media/${media.id}/${media.fileName}';
  }

}