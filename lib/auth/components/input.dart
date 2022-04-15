import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';
class Input extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  const Input({Key? key, required this.controller, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool hideText = text == "Heslo" ? true : false ;
    return Container(
      child: TextField(
        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        obscureText: hideText,
        enableSuggestions: false,
        autocorrect: false,
        controller: controller,
        decoration:  InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          hintText: text,
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black45,width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.mutedColor,width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
