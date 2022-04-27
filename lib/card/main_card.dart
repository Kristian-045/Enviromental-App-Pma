import 'package:auth/card/components/Article.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'components/body_card.dart';

class MainCard extends StatelessWidget {
  int index;
  Article article;
  MainCard({Key? key , required  this.index, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyCard(index: index, article: article,),
      // backgroundColor: Theme.of(context).colorScheme.secondaryColor,
    );
  }

}
