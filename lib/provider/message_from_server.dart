
import 'package:flutter/cupertino.dart';

class MessageResponse with ChangeNotifier{


 final List<String> message;

 MessageResponse({@required this.message});


 factory MessageResponse.fromJson(String type,Map<String,dynamic> json){
   return MessageResponse(message: json[type]);
 }

}