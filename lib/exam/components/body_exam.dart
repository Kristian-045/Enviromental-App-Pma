import 'dart:async';
import 'package:auth/exam/components/answer.dart';
import 'package:auth/exam/components/questions.dart';
import 'package:auth/exam/screen/main_results.dart';
import 'package:auth/home/components/background.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyExam extends StatefulWidget {
  const BodyExam({Key? key}) : super(key: key);

  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<BodyExam> {
  final List _questions = getQuesstion();
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;
  int _timeleft=30;
  late Timer _timer;


  void _startCountDown(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(_timeleft>0){
           _timeleft--;
        }else{
          _questionAnswered(false);
          _timer.cancel();
        }
      });
    });
  }
  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;

      // check if answer was correct
      if (answerScore ) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
      //when the quiz ends
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    //if answerwasselecter som tam pridal ja
    if (answerWasSelected) {
      setState(() {
        _questionIndex++;
        answerWasSelected = false;
        correctAnswerSelected = false;
        _timeleft=30;
      });
      // what happens at the end of the quiz
      if (_questionIndex >= _questions.length) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MainResults(
                      totalScore: _totalScore,
                      maxScore: _questions.length,
                    )));
        _questionIndex--;
      }
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }
  @override
  void initState() {
    super.initState();
    _startCountDown();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        BackgroundGradient(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              ProgressBar(timeleft: _timeleft),
              Padding(padding: const EdgeInsets.only(top: 40)),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "Otázka " + (_questionIndex + 1).toString() + "/",
                          style: const TextStyle(fontSize: 35)),
                      TextSpan(
                          text: _questions.length.toString(),
                          style: const TextStyle(fontSize: 22)),
                    ],
                  ),
                  // textScaleFactor: 1,
                ),
              ),
              Line(width100: width100),
              const Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                width: width100,
                height: 450,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFFA7B1AA), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 20),
                      child: Text(
                        _questions[_questionIndex]["question"],
                        style: const TextStyle(fontSize: 23),
                      ),
                    ),
                    ...(_questions[_questionIndex]['answers']
                            as List<Map<String, Object>>)
                        .map(
                      (answer) => Answer(
                        answerText: answer['answerText'] as String,
                        answerColor: answerWasSelected
                            ? answer['score'] == true
                                ? Colors.green
                                : Colors.red
                            : Colors.white,
                        // answerColor: Colors.red,
                        answerTap: () {
                          // if answer was already selected then nothing happens onTap
                          print(answerWasSelected);
                          if (answerWasSelected) {
                            return;
                          }
                          _timer.cancel();

                          //answer is being selected
                          _questionAnswered(answer['score'] as bool);
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    SizedBox(
                      width: width100 - 130,
                      child: ElevatedButton(
                          onPressed: () {
                            _startCountDown();
                            _nextQuestion();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Ďalej",
                            style: TextStyle(fontSize: 17),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required int timeleft,
  }) : _timeleft = timeleft, super(key: key);

  final int _timeleft;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF848B85), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          // LayoutBuilder provide us the available space for the conatiner
          // constraints.maxWidth needed for our animation
          LayoutBuilder(
            builder: (context, constraints) => AnimatedContainer(
              // from 0 to 1 it takes 60s
              width: 50+((constraints.maxWidth-50) / 30) * (30-_timeleft),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.progressColor,
                borderRadius: BorderRadius.circular(50),
              ), duration: const Duration(milliseconds: 980),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("$_timeleft sek."),
                  // SvgPicture.asset("assets/icons/clock.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
    required this.width100,
  }) : super(key: key);

  final double width100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 45),
      child: Container(
        width: width100,
        height: 5,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryColor,
            borderRadius: BorderRadius.all(const Radius.circular(100))),
      ),
    );
  }
}
/*

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF848B85), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          // LayoutBuilder provide us the available space for the conatiner
          // constraints.maxWidth needed for our animation
          LayoutBuilder(
            builder: (context, constraints) => Container(
              // from 0 to 1 it takes 60s
              width: constraints.maxWidth * 0.50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.progressColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("$_timeleft sec"),
                  // SvgPicture.asset("assets/icons/clock.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
