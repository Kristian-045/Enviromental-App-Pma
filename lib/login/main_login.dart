import 'package:auth/home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/user_data.dart';
import '../api/user_token.dart';

class Login extends StatelessWidget {
  const Login({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      emailController.dispose();
      passwordController.dispose();
    }
    return Scaffold(
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
          ),
          color: Colors.teal,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: emailController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -10.0),
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),)
                        ),
                      ),
                    ),
                    Container(
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -10.0),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary:  const Color.fromRGBO(16, 124, 190, 1.0)
                            primary:  Colors.teal
                        ),
                        onPressed: () async {
                          print(emailController.text);
                          print(passwordController.text);
                          try{
                            var user_data = await fetchUserToken(emailController.text,passwordController.text).timeout(const Duration(seconds: 2));
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainHome(name: user_data.name)));
                          }
                          on Exception catch(e){

                          }


                        },
                        child: Text("Login")),
                    )


                  ],
                ),
              ),
            ],
          )
        ),
      ),




    );
  }
}
