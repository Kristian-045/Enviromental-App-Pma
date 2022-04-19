import 'package:auth/home/components/background.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BodyCard extends StatelessWidget {
  const BodyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height ;
    return
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Theme.of(context).colorScheme.userColor),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).colorScheme.userColor,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: SvgPicture.asset("assets/images/electric-car.svg"
                  ,fit: BoxFit.contain,)
                )
              ],
            ),
          ),
          Container(
            width: width100,
            height: 400,
            padding: EdgeInsets.symmetric(horizontal: 20) ,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.greenCard,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text("helo mate"),
            ),
          )
        ],
    );
  }
}
