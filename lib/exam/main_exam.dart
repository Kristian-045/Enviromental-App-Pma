import 'package:auth/exam/components/body_exam.dart';
import 'package:flutter/material.dart';

class Exam extends StatelessWidget {
  const Exam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 70.0),
          child: BodyExam(),
    ));
  }
}
