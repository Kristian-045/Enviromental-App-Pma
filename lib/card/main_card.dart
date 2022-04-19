import 'package:flutter/material.dart';

import 'components/body_card.dart';
class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyCard(),
    );
  }
}
