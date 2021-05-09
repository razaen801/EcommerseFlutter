
import 'dart:convert';

import 'package:flutter/foundation.dart';


List<UserLoginDetails> userDetailsFromJson(String str) =>
    List<UserLoginDetails>.from(json.decode(str).map((x) => UserLoginDetails.fromJson(x)));

String userDetailsToJson(List<UserLoginDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class UserLoginDetails{

  final int id;
  final String name;
  final String email;
  final int role_id;
  final int verified;
  final int is_approved;
  final DateTime created_at;
  final DateTime updated_at;

  UserLoginDetails({this.id,this.name, this.email,this.role_id,this.verified,
      this.is_approved,this.created_at,this.updated_at});



  factory UserLoginDetails.fromJson(Map<String, dynamic> json) => UserLoginDetails(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    role_id: json["role_id"],
    verified: json["verified"],
    is_approved: json["is_approved"],
    created_at: DateTime.parse(json["created_at"]),
    updated_at: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "role_id": role_id,
    "verified": verified,
    "is_approved": is_approved,
    "created_at": created_at.toIso8601String(),
    "updated_at": updated_at.toIso8601String(),
  };
}