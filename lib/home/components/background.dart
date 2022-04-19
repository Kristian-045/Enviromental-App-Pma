import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthBackground = MediaQuery.of(context).size.width;
    final double heightBackground = MediaQuery.of(context).size.height ;

    return SizedBox(
        width:widthBackground,
        height: heightBackground,
        // fit: BoxFit.cover,
        child:SvgPicture.asset(
          "assets/images/background-flutter-big.svg",
          fit: BoxFit.cover,
          alignment:const Alignment(-1.0,-1.0),

        ) ,
      );
  }
}

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthBackground = MediaQuery.of(context).size.width;
    final double heightBackground = MediaQuery.of(context).size.height ;

    return SizedBox(
      width:widthBackground,
      height: heightBackground,
      // fit: BoxFit.cover,
      child:SvgPicture.asset(
        "assets/images/background-flutter-big-gradient.svg",
        fit: BoxFit.cover,
        alignment:const Alignment(-1.0,-1.0),

      ) ,
    );
  }
}
