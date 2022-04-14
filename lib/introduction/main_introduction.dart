import 'package:auth/introduction/components/body_introduction.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyIntroduction(),
    );

  }
}
