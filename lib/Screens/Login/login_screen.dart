//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sexylogin/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body());
  }
}
