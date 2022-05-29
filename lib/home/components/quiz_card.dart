import 'package:auth/api/quiz_data.dart';
import 'package:auth/card/components/Article.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class QuizCard extends StatelessWidget {
  int index;
  Quiz quiz;

  QuizCard({Key? key, required this.index, required this.quiz})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String svgPath = "assets/images/electric-car.svg";
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
          color: Theme.of(context).colorScheme.grayColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryColor,
            width: 3
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width100 * 0.9,
              // height: 200,
              height: 200,
              child: Hero(
                tag: "quiz/$index",
                child: SvgPicture.asset(
                  // svgPath,
                  "assets/images/quiz.svg",
                  fit: BoxFit.contain,
                  alignment: const Alignment(-1.0, -1.0),
                ),
              ),
            ),
            SizedBox(
                width: width100,
                child: Center(
                    child: Text(
                  quiz.name,
                  style: TextStyle(fontSize: 20),
                ))),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      ),
    );
  }
}
