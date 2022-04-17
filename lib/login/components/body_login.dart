import 'package:auth/auth/components/input.dart';
import 'package:auth/home/components/background.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:auth/home/main_home.dart';
import 'package:auth/register/main_register.dart';
import 'package:flutter/material.dart';


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
    final _formKey = GlobalKey<FormState>();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      emailController.dispose();
      passwordController.dispose();
    }


    return
    Stack(
      children: [
        Background(),
        Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height
            ),
            // color: Colors.white,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Prihlásenie",style: Theme.of(context).textTheme.headline1,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35 ,vertical: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Input(controller: emailController, name: "E-mail", emailValidation: true),
                          const Padding(padding: EdgeInsets.only(top: 13)),
                          Input(controller: passwordController, name: "Heslo", lengthValidation: 8,),
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
                                    if(_formKey.currentState!.validate()){
                                      var user_data = await fetchUserToken(emailController.text,passwordController.text)
                                          .timeout(const Duration(seconds: 10));
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainHome(name: user_data.name)));
                                    }else{
                                      FocusManager.instance.primaryFocus?.unfocus();
                                    }

                                  }
                                  on Exception catch(e){}
                                },
                                child: const Text("Prihlásiť sa",style: TextStyle(fontSize: 17,),)),
                          ),
                          // Button(onPressfunction: btnOnPress(), text:"Registrovať sa",),

                          const Padding(padding: EdgeInsets.only(top: 8)),

                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => const Register()));
                            },
                            child: const Text("Registrovať sa",
                              style: TextStyle(
                                // color: Theme.of(context).primaryColor,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ],
    );
  }
}
