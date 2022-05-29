import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class User {
  final int id;
  final String email;
  final String name;
  // final String email_verified_at;
  // final String created_at;
  // final String updated_at;

  // final String token;

  const User({
    required this.id,
    required this.email,
    required this.name,
    // required this.email_verified_at,
    // required this.created_at,
    // required this.updated_at,
    // required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      email: json['email'].toString(),
      name: json['name'].toString(),
      // email_verified_at: json['email_verified_at'],
      // created_at: json['created_at']as String,
      // updated_at:json["updated_at"]as String,
    );
  }
}
Future<User> fetchUser(String token) async {
  final response = await http
      .get(Uri.parse('http://eco-app.lubovnan.sk/public/api/user'),
      headers:{
        "Content-type": "application/json",
        "Accept": "application/json",
        'Authorization': "Bearer "+token
      }
  );


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print('aaa');
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // print('bbb');
    print(response.statusCode);
    throw Exception('Failed to load user');
  }
}