import 'package:auth/home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/user_data.dart';
import '../../api/user_token.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthBackground = MediaQuery.of(context).size.width;
    //to to je vyska klavesnice MediaQuery.of(context).viewInsets.bottom
    final double heightBackground = MediaQuery.of(context).size.height + MediaQuery.of(context).viewInsets.bottom;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      emailController.dispose();
      passwordController.dispose();
    }
    return
      Stack(
      children: [
        Container(
          width:widthBackground,
          height: heightBackground,
          // fit: BoxFit.cover,
          child:SvgPicture.asset(
            "assets/images/background-flutter-big.svg",
            fit: BoxFit.cover,

          ) ,
        ),

        Container(

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height
                ),
                // color: Colors.white,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Prihlásenie",style: Theme.of(context).textTheme.headline1,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35 ,vertical: 20),
                      margin: EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: TextField(
                              cursorColor: Colors.black,
                              textAlign: TextAlign.center,
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'E-mail',
                                hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black,width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black,width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 13)),
                          Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: passwordController,
                              decoration:  InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                                hintText: "Heslo",
                                contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black,width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black,width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary:  const Color.fromRGBO(16, 124, 190, 1.0)
                                    primary:  Theme.of(context).primaryColor,
                                    padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)
                                    )
                                ),
                                onPressed: () async {
                                  try{
                                    var user_data = await fetchUserToken(emailController.text,passwordController.text).timeout(const Duration(seconds: 5));
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainHome(name: user_data.name)));
                                  }
                                  on Exception catch(e){}
                                },
                                child: Text("Prihlásiť sa",style: TextStyle(fontSize: 17,),)),
                          ),
                          Padding(padding: EdgeInsets.only(top: 8)),
                          Text("Vytvoriť účet",
                            style: TextStyle(
                              // color: Theme.of(context).primaryColor,
                                color: Colors.black,
                                decoration: TextDecoration.underline
                            ),
                          )


                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }
}
