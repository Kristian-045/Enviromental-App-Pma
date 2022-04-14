import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Future<Function?> onPressfunction;
  final String text;

  const Button({Key? key, required this.onPressfunction, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary:  Theme.of(context).primaryColor,
            padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            )
        ),
        onPressed:()async {onPressfunction;},
        child: Text("Prihlásiť sa",style: TextStyle(fontSize: 17,),)
    );
  }
}
