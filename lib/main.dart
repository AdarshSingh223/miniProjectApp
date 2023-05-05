import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sexylogin/Screens/Welcome/welcome_screen.dart';
import 'package:sexylogin/Screens/sign%20up/components/signup_screen.dart';
import 'package:sexylogin/constraints.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

