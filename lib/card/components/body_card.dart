import 'package:auth/card/components/Article.dart';
import 'package:auth/home/components/background.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BodyCard extends StatelessWidget {
  int index;
  Article article;
  BodyCard({Key? key, required this.index, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height ;
    return
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: (){Navigator.pop(context);},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Theme.of(context).colorScheme.userColor),
                      ),
                      child: GestureDetector(
                        onTap: (){Navigator.pop(context);},
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.userColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: Hero(
                      tag: "image/$index",
                      child: SvgPicture.asset(article.imgPath
                      ,fit: BoxFit.contain,),
                    )
                  )
                ],
              ),
            ),
            Container(
              width: width100,
              height: 600,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.greenCard,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
              ),
              child: Stack(
                children: [
                  // const BackgroundGradientNoColor(),
                  Padding(
                      padding: const EdgeInsets.only(top:20.0,left: 20, right: 20),
                    child: SizedBox(
                      width: width100,
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 30),
                              child: Text(article.title,style: TextStyle(fontSize: 25,))),
                            Text(article.description,style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
    ),
      );
  }
}
