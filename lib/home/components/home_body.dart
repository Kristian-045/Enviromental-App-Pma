import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            width: size.width,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
            ),
            child:
              Column(
                children: [
                  Container(
                    margin:EdgeInsets.only(top: 10),
                    // padding: EdgeInsets.all(50),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(10000)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/avatar.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: Image (image: AssetImage("assets/images/avatar.png"),),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    child:Text(name,style: TextStyle(fontSize: 30,color: Colors.white),),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
