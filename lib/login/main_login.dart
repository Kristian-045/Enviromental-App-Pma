import 'package:auth/home/main_home.dart';
import 'package:auth/login/components/body_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/user_data.dart';
import '../api/user_token.dart';

class Login extends StatelessWidget {
  const Login({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return  const Scaffold(
      resizeToAvoidBottomInset:false,
      body: BodyLogin()
    );
  }
}
