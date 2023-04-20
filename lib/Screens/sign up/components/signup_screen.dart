import 'package:flutter/material.dart';

import 'package:sexylogin/Screens/sign up/components/body.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body()
    );
  }
}



