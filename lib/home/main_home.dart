import 'package:auth/home/components/home_body.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(name: name,),
    );
  }
}