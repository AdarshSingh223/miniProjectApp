import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sexylogin/Screens/Welcome/components/background.dart';
import 'package:sexylogin/Screens/About/components/background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              "ABOUT", 
              style: TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
            Image.asset("assets/images/about.png"),
            Text("This App was made specifically for the purpose of\n\"Mini Project\" (18ECMP68).\n\nThis Application provides a live analysis of traffic which\nis generated through hardware parts. This App in no\nway provides any \"Real world\" data."),
            Text("\nApp made for the project idea :                                            ")
          ],
        ),
      ),
    );
  }
}