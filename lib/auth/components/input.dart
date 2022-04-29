import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';
class Input extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final bool emailValidation;
  final int lengthValidation;
  final bool error ;

  const Input({Key? key,
    required this.controller,
    required this.name,
    this.emailValidation=false,
    this.lengthValidation=1,
    this.error=false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool hideText = name == "Heslo" ? true : false ;
    bool error =  false;
    return Container(
      child: TextFormField(

        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        obscureText: hideText,
        enableSuggestions: false,
        autocorrect: false,
        controller: controller,
        validator: (text){
          if(text!.length < lengthValidation) {
            if(lengthValidation==1){
              return "$name musíte zadať mať minimálne 1 znak";
            }else if (lengthValidation<5){
              return "$name musíte zadať mať minimálne $lengthValidation znaky";
            }else{
              return "$name musíte zadať mať minimálne $lengthValidation znakov";
            }
          }
          if(emailValidation && !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text)){
            return "Zadali ste zlý email";
          }

          return null;
        },
        decoration:  InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          hintText: name,
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black45, width:2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.mutedColor,width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.lightDanger,width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black45, width:2),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}



