import 'package:auth/auth/components/button.dart';
import 'package:auth/card/components/Article.dart';
import 'package:auth/card/components/body_card.dart';
import 'package:auth/card/main_card.dart';
import 'package:auth/exam/main_exam.dart';
import 'package:auth/home/components/background.dart';
import 'package:auth/home/components/card.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:auth/home/components/home_hello.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key, required this.name}) : super(key: key);
  final String name;


  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height ;
    List <Article> articles = getArticles();
    Size size = MediaQuery.of(context).size;
    return Stack(
      children:  [
        const BackgroundGradient(),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Hello(name: name,),
              const Padding(padding: EdgeInsets.only(top: 60)),
              Container(
                height: height100*0.45,
                child: CarouselSlider.builder(
                  options:CarouselOptions(
                    height: 400,
                    viewportFraction: 0.7,
                    enlargeCenterPage: true,
                  ),
                  itemCount: articles.length,
                  itemBuilder: (context, index, realIndex) {
                    // final urlImage = urlImages [index];
                    return buildImage (index,context,articles[index]);
                  },
                ), // CarouselSlider.builder
              ),
              const Padding(padding: EdgeInsets.only(top: 80)),
              ButtonNavigate(onPressfunction: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Exam()));
              }, 
                  text: "Otestuj sa", color:true
              )

            ],
          ),
        ),
      ],
    );
  }
}


Widget buildImage(int index, BuildContext context, Article article){
  return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> MainCard(index:index,article: article,)));} ,
        child:
          HeroCard(index: index, article: article,)
      ),

  );
}
