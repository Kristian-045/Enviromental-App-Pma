import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class UserWithToken {
  final int id;
  final String email;
  final String name;
  final String token;


  const UserWithToken({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
  });

  factory UserWithToken.fromJson(Map<String, dynamic> json) {
    return UserWithToken(
      id: json["user"]['id'] as int,
      email: json["user"]['email'].toString(),
      name: json["user"]['name'].toString(),
      token:json["token"] as String,
    );
  }
}
Future<UserWithToken> fetchUserTokenRegister(String email, String name,String password) async {

  final response = await http
      .post(Uri.parse('http://eco-app.lubovnan.sk/api/register'),
      headers:{
        // "Content-type": "application/json",
        // "Accept": "application/json",
        // 'Authorization': "Bearer "+token
      },
      body:{
        "email":email,
        "name":name,
        "password":password,
        "password_confirmation":password,

      }
  );

  if (response.statusCode == 200 || response.statusCode == 201) {

    final prefs = await SharedPreferences.getInstance();
    var userData=UserWithToken.fromJson(jsonDecode(response.body));
    prefs.setString('token',userData.token );
    prefs.setString('name',userData.name );
    return userData ;
  } else {

    print(response.statusCode);
    throw Exception('Failed to load album');
  }
}