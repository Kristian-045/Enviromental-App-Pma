
import 'package:auth/auth/components/button.dart';
import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:auth/home/main_home.dart';
import 'package:auth/login/main_login.dart';
import 'package:auth/register/main_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyIntroduction extends StatelessWidget {
  const BodyIntroduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width100 = MediaQuery.of(context).size.width;
    final double height100 = MediaQuery.of(context).size.height ;

    return Stack(
      children: [
        // const Background(),
        Container(
          color: Theme.of(context).colorScheme.secondaryColor,
          child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              constraints: BoxConstraints(
                minHeight: height100,
              ),
              // alignment: Alignment.center,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 60)),
                  SizedBox(
                    width: width100,
                    child:
                    Text(
                      "EcoDrive", style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 10,right: 10),
                    child: SizedBox(
                      width: width100,
                      height: height100*0.5,
                      child: SvgPicture.asset(
                        "assets/images/introductionSvg.svg",
                        fit: BoxFit.contain,
                        alignment:const Alignment(0,-0.3),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ButtonNavigate(onPressfunction:()
                    { Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login() ));}
                    , text: 'Prihlásiť sa', color: true,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ButtonNavigate(onPressfunction:()
                  { Navigator.push(context, MaterialPageRoute(builder: (context)=> const Register() ));}
                    , text: 'Registrovať sa', color: false,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainHome(name: "") ));},
                      child:const Text("Pokračovať bez prihlásenia")
                  )


                ],
              ),
            ),
          ) ,
        ),
      ],
    );
  }
}
