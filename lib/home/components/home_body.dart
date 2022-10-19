import 'package:auth/api/quiz_data.dart';
import 'package:auth/auth/components/button.dart';
import 'package:auth/card/components/Article.dart';
import 'package:auth/card/components/body_card.dart';
import 'package:auth/card/main_card.dart';
import 'package:auth/exam/main_exam.dart';
import 'package:auth/home/components/background.dart';
import 'package:auth/home/components/card.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:auth/home/components/home_hello.dart';
import 'package:auth/home/components/quiz_card.dart';
import 'package:auth/quiz/main_quiz.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class HomeBody extends StatefulWidget  {
  const HomeBody({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _HomeBodyState createState()=> _HomeBodyState();

}

class _HomeBodyState extends State<HomeBody>{
  late Future<Quizzes> futureQuizzes;
  @override
  void initState() {
    super.initState();
    futureQuizzes =fetchQuizzes();
  }
  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height;

    List<Article> articles = getArticles();
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundGradient(),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Hello(
                name: widget.name,
              ),
              const Padding(padding: EdgeInsets.only(top: 60)),
              CardSlider(height100: height100, articles: articles),
              const Padding(padding: EdgeInsets.only(top: 80)),
             /* ButtonNavigate(
                  onPressfunction: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Exam()));},
                  text: "Otestuj sa",
                  color: true),*/

              SizedBox(width:width100-60,
                child: const Text("Kvizy",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              FutureBuilder<Quizzes>(
                future: futureQuizzes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String pomocna ="";
                    Quizzes quizzes = snapshot.data! ;
                    List<Quiz> quiz = quizzes.quizzes;

                    return QuizSlider(height100: height100, quiz: quiz);
                  } else if (snapshot.hasError) {
                    print('${snapshot.error}');
                    return Text('Žiadne pripojenie k internetu');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 50))
            ],

          ),
        ),
      ],
    );
  }

}

class QuizSlider extends StatelessWidget {
  const QuizSlider({
    Key? key,
    required this.height100,
    required this.quiz,
  }) : super(key: key);

  final double height100;
  final List<Quiz> quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height100 * 0.45,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 350,
          viewportFraction: 0.7,
          enlargeCenterPage: true,
        ),
        itemCount: quiz.length,
        itemBuilder: (context, index, realIndex) {
          // final urlImage = urlImages [index];
          return buildImageQuiz(index, context, quiz[index]);
        },
      ), // CarouselSlider.builder
    );
  }
}

class CardSlider extends StatelessWidget {
  const CardSlider({
    Key? key,
    required this.height100,
    required this.articles,
  }) : super(key: key);

  final double height100;
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: height100 * 0.45,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 350,
          viewportFraction: 0.7,
          enlargeCenterPage: true,
        ),
        itemCount: articles.length,
        itemBuilder: (context, index, realIndex) {
          // final urlImage = urlImages [index];
          return buildImageCard(index, context, articles[index]);
        },
      ), // CarouselSlider.builder
    );
  }
}
Widget buildImageQuiz(int index, BuildContext context, Quiz quiz) {
  print("halooo");
  print(index);
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: GestureDetector(
        onTap: () {
          List<dynamic> questions = json.decode(quiz.questions);
          print('heh mam az tolko otazok '+questions[0]["question"].toString());
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => MainQuiz(
                  index: index,
                  quiz: quiz,
                  questions:questions
              ))
          );

        },
        child: QuizCard(
          index: index,
          quiz: quiz,
        )
    ),
  );
}

Widget buildImageCard(int index, BuildContext context, Article article) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainCard(
                        index: index,
                        article: article,
                      )));
        },
        child: HeroCard(
          index: index,
          article: article,
        )),
  );
}
