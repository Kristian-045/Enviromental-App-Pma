import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../login/main_login.dart';

class ButtonNavigate extends StatelessWidget {
  final Function onPressfunction;
  final String text;
  final bool color;


  const ButtonNavigate({Key? key, required this.onPressfunction, required this.text, required this.color,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height ;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize:Size(width100*0.7, 20) ,
            primary:  color? Theme.of(context).primaryColor:Colors.white,
            padding:const EdgeInsets.symmetric(vertical: 12,horizontal: 60),

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side:color?
                BorderSide(width: 0, color: Theme.of(context).colorScheme.mutedColor,):
                BorderSide(width: 0, color: Theme.of(context).colorScheme.mutedColor,),
            ),

        ),
        onPressed:(){onPressfunction();},
        child: Text(text,style: TextStyle(fontSize: 19,color: color?Colors.white:Colors.black),)
    );
  }
}


class ButtonAsync extends StatelessWidget {
  final Future<Function?> onPressfunction;
  final String text;

  const ButtonAsync({Key? key, required this.onPressfunction, required this.text}) : super(key: key);

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
        child: Text(text,style: TextStyle(fontSize: 17,),)
    );
  }
}

class Button extends StatelessWidget {
  final Function onPressfunction;
  final String text;
  final bool color;

  const Button({Key? key, required this.onPressfunction, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height ;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize:Size(width100*0.5, 20) ,
          primary:  color? Theme.of(context).primaryColor:Colors.white,
          padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 50),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side:color?
            BorderSide(width: 0, color: Theme.of(context).colorScheme.mutedColor,):
            BorderSide(width: 0, color: Theme.of(context).colorScheme.mutedColor,),
          ),

        ),
        onPressed:(){onPressfunction();},
        child: Text(text,style: TextStyle(fontSize: 19,color: color?Colors.white:Colors.black),)
    );
  }
}
