import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sexylogin/Screens/Login/components/background.dart';
import 'package:sexylogin/components/already_have_an_account_check.dart';
import 'package:sexylogin/components/rounded_button.dart';
import 'package:sexylogin/constraints.dart';
import 'package:sexylogin/components/text_field_container.dart';

import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';


class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (
                value
              ) {},
            ),
            RoundedPasswordField(
              onChanged: (
                value
              ) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
              color: kPrimaryColor,
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
      
              }
            )
          ]
        ),
      ),
    );
  }
}

