
import 'package:auth/api/user_data.dart';
import 'package:auth/api/user_token.dart';
import 'package:auth/home/components/home_body.dart';
import 'package:auth/home/main_home.dart';
import 'package:auth/introduction/main_introduction.dart';
import 'package:auth/login/main_login.dart';
import 'package:auth/register/main_register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'card/main_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff399d43),
        // secondaryColor: Colors.green,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 45, fontWeight: FontWeight.normal,color: Colors.black ),
          bodyText1: TextStyle(fontSize:20, color: Colors.black)
        ),

        // primary&Swatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String token = "";
  String text = "Logo";
  // late Future<User> futureUser;
  // late Future<UserWithToken> futureUserWithToken;


  @override
  void initState() {
    super.initState();
    _loadTokenLocal();
  }
  Future<User> saveUserDetails(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final user = await fetchUser(token);

    prefs.setString("name", user.name);
    print('set the other values too ');

    return user;
  }

  void _loadTokenLocal() async {
    final prefs = await SharedPreferences.getInstance();


    setState(() {
      token = (prefs.getString('token') ?? "0");

    });
    try{

      if(token!="0"){
        var user = await  saveUserDetails(token).timeout(const Duration(seconds: 15));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainHome(name: user.name,)));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Introduction()));
      }
      //len zatial kym robim user
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainHome(name: "Kristianko")));
    }
    on Exception catch(e){
      if(e.toString() == "Exception: Failed to load user"){
        print('i catch that');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
      }
      else{
        print("helo that is error");
        print(e);
        setState(() {
          text="no internet, please connect to the internet";
        });
      }

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body:
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 50 ,left:20,right: 20 ),
          child: Text(text,style: Theme.of(context).textTheme.bodyText1,)
        ),


    );
  }
}
