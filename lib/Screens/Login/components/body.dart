import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sexylogin/Screens/Login/components/background.dart';


class Body extends StatelessWidget {
  const Body({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background(
      child: Column(
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ]
      ),
    );
  }
}
