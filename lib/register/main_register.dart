import 'package:auth/register/components/body_register.dart';
import 'package:flutter/material.dart';


class Register extends StatelessWidget {
  const Register({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        // resizeToAvoidBottomInset:false,
        body: BodyRegister()
    );
  }
}
