import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final Function answerTap;

  Answer(
      {required this.answerText,
      required this.answerColor,
      required this.answerTap});

  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height;
    IconData getTheRightIcon() {
      return answerColor == Colors.red ? Icons.close : Icons.done;
    }
    return InkWell(
        onTap:(){ answerTap();
        print('som v answer');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 17),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: answerColor == Colors.white
              ? Colors.black
              : answerColor,),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width100*0.55,
              child: Text(
                answerText,
                style: TextStyle(color: answerColor == Colors.white
                    ? Colors.black
                    : answerColor,)
              ),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: answerColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: answerColor == Colors.white
                    ? Colors.black
                    : answerColor,),
              ),
               child: answerColor == Colors.white
                  ? null
                  : Icon(getTheRightIcon(), size: 16, color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }


/*@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        answerTap();
        print('som v answer');
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }*/

/*
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap(),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color:answerColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answerText,
              style: TextStyle(color: answerColor, fontSize: 16),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: answerColor == Colors.white
                    ? Colors.transparent
                    : answerColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: answerColor),
              ),
              */ /* child: getTheRightColor() == kGrayColor
                  ? null
                  : Icon(getTheRightIcon(), size: 16),*/ /*
            )
          ],
        ),
      ),
    );
  }*/
}
