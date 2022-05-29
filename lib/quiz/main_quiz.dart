import 'package:auth/card/components/Article.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:auth/quiz/components/body_quiz.dart';
import 'package:flutter/material.dart';
import '../api/quiz_data.dart';


class MainQuiz extends StatelessWidget {
  int index;
  Quiz quiz;
  final List<dynamic> questions;
  MainQuiz({Key? key , required  this.index, required this.quiz,required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyQuiz(quiz: quiz,questions:questions),
      // backgroundColor: Theme.of(context).colorScheme.secondaryColor,
    );
  }

}


