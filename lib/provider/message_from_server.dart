
import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<String> MessageFromServer(String type,String str) =>
    List<String>.from(json.decode(str).map((x)=>MessageResponse.fromJson(type, x)));

class MessageResponse with ChangeNotifier{


 final List<String> message;

 MessageResponse({@required this.message});


 factory MessageResponse.fromJson(String type,Map<String,dynamic> json){
   return MessageResponse(message: List<String>.from(json[type].map((x) => x.toString())));
 }

 factory MessageResponse.fromSuccessJson(Map<String,dynamic> json){
   List<String> list;
   list.add(json['message']);
   return MessageResponse(message: list);

 }

}