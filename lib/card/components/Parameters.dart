import 'package:auth/home/components/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class ParameterCard extends StatelessWidget {
  List parameters;
  ParameterCard({Key? key, required this.parameters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ParameterText(parameter: parameters[0]),
        ParameterText(parameter: parameters[1]),
        ParameterText(parameter: parameters[2]),

      ],
    );
  }
}

class ParameterText extends StatelessWidget {
  List parameter;
  ParameterText({Key? key,required this.parameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black,),
              children: <TextSpan>[
                TextSpan(text:  parameter[1], style: const TextStyle(fontSize: 40)),
                TextSpan(text:  parameter[2],style:  const TextStyle(fontSize: 18)),
              ],
            ),
            // textScaleFactor: 1,
          ),
        ),
        Center(
            child: Text(parameter[0],style: TextStyle(color: Theme.of(context).colorScheme.mutedTextColor, fontSize: 17),)
        )
      ],
    );
  }
}

