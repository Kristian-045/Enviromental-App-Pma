import 'package:auth/api/user_register.dart';
import 'package:auth/auth/components/button.dart';
import 'package:auth/auth/components/input.dart';
import 'package:auth/home/components/background.dart';
import 'package:auth/home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/user_data.dart';
import '../../api/user_token.dart';

class BodyRegister extends StatelessWidget {
  const BodyRegister({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthBackground = MediaQuery.of(context).size.width;
    final double heightBackground = MediaQuery.of(context).size.height ;
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();


    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      emailController.dispose();
      nameController.dispose();
      passwordController.dispose();
    }
    Future<Function?> btnOnPress () async {
      try{
        var userData = await fetchUserTokenRegister(emailController.text,nameController.text,passwordController.text)
            .timeout(const Duration(seconds: 10));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainHome(name: userData.name)));
      }
      on Exception catch(e){}
    }

    return
      Stack(
        children: [
          Background(),
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
                      Text("Vytvoriť účet",style: Theme.of(context).textTheme.headline1,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 35 ,vertical: 20),
                        margin: EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Input(controller: emailController, text: "E-mail"),
                            const Padding(padding: EdgeInsets.only(top: 13)),
                            Input(controller: nameController, text: "Meno"),
                            const Padding(padding: EdgeInsets.only(top: 13)),
                            Input(controller: passwordController, text: "Heslo"),


                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary:  Theme.of(context).primaryColor,
                                      padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)
                                      )
                                  ),
                                  onPressed: () async {
                                    try{
                                      var userData = await fetchUserTokenRegister(emailController.text,nameController.text,passwordController.text)
                                          .timeout(const Duration(seconds: 10));
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainHome(name: userData.name)));
                                    }
                                    on Exception catch(e){}
                                  },
                                  child: Text("Prihlásiť sa",style: TextStyle(fontSize: 17,),)),
                            ),
                            // Button(onPressfunction: btnOnPress(), text:"Registrovať sa",),

                            Padding(padding: const EdgeInsets.only(top: 8)),
                            const Text("Vytvoriť účet",
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
