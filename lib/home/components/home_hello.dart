import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Hello extends StatelessWidget {
  final String name;

  const Hello({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height ;
    var secondaryColor;
    return SizedBox(
      width: width100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top:60),),
            Row(
              children: [
                //60 je padding
                SizedBox(width:width100-50-60,
                  child: Text("Ahoj $name",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
                ),
                SizedBox(width:50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape:BoxShape.circle,
                      border: Border.all(width: 2,color:Theme.of(context).colorScheme.primaryColor )
                    ),

                    child: Icon(
                      Icons.person_outline_rounded,
                      color: Theme.of(context).colorScheme.userColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top:30)),
            SizedBox(width:width100,
              child: Text("Vyzerá že sa cítiš dobre.\nPoď sa naučiť nové veci :) \n// mozno nieco ked vam napadne nieco lepsie",
                style: TextStyle(fontSize: 16,color:Theme.of(context).colorScheme.mutedTextColor ),),
            ),

          ],
        ),
      ),

    );
  }
}
