import 'package:auth/home/components/background.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';
class MainResults extends StatelessWidget {
  final int totalScore;
  final int maxScore;
  const MainResults({Key? key, required this.totalScore, required this.maxScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          Container(
            // color: Theme.of(context).colorScheme.secondaryColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Score",style: TextStyle(fontSize: 40),),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Text((totalScore*10).toString()+"/"+(maxScore*10).toString(),style: TextStyle(fontSize: 30),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 25),
            child: GestureDetector(
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
          ),
        ],
      ),


    );
  }
}
