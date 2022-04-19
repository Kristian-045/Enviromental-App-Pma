import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class HeroCard extends StatelessWidget {
  int index;

  HeroCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String svgPath="assets/images/electric-car.svg";
    final SvgParser parser = SvgParser();
    try {
      parser.parse(svgPath, warningsAsErrors: true);
      print('SVG is supported');
    } catch (e) {
      print('SVG contains unsupported features');
    }
    final double width100 = MediaQuery.of(context).size.width;
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.greenCard,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 20)),
            Container(
              width: width100*0.9,
              height: 200,
              child: SvgPicture.asset(
                svgPath,
                fit: BoxFit.contain,
                alignment:const Alignment(-1.0,-1.0),
              ),
            ),
            SizedBox(
              width: width100,
              child: const Text("Elektrocke motory",style: TextStyle(fontSize: 20),)
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
                width: width100,
                child: Text("viac informacii ked swipne s hore ... nejaky text aktualne neviem aky",
                  style: TextStyle(color: Theme.of(context).colorScheme.mutedTextColor),)
            ),

          ],
        ),
      ),
    );
  }
}
