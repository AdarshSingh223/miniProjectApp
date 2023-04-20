import 'package:flutter/material.dart';
import 'package:sexylogin/Screens/Welcome/welcome_screen.dart';
import 'package:sexylogin/Screens/sign%20up/components/signup_screen.dart';
import 'package:sexylogin/constraints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
      home: WelcomeScreen(),
      routes: {
        'login_signup' :(context) => signUpScreen()
      },
    );
  }
}

