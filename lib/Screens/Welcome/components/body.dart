import 'package:flutter/material.dart';
import 'package:sexylogin/Screens/About/about_scree.dart';
import 'package:sexylogin/Screens/Login/login_screen.dart';
import 'package:sexylogin/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sexylogin/Screens/sign%20up/components/signup_screen.dart';
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
                text: "Sign Up",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press : () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => signUpScreen()));
                }
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen()));
                    }, 
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Icon(Icons.info, color: kPrimaryColor,size: 30,),                                  
                                )
                              )
                            ]
                          )

                        )
                      ],
                    ) 
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}



