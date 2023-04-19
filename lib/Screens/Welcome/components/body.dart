import 'package:flutter/material.dart';
import 'package:sexylogin/Screens/Login/login_screen.dart';
import 'package:sexylogin/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sexylogin/components/rounded_button.dart';
import 'package:sexylogin/constraints.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    return Background(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "WELCOME TO EDU",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.45,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              RoundedButton(
                text: "Login",
                color: kPrimaryColor,
                press : () {
                  Navigator.of(
                    context
                  ).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen()
                    )
                  );
                }
              ),
              RoundedButton(
                text: "SignUp",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press : () {}
              ),
            ],
          ),
        ],
      ),
    );

  }
}



