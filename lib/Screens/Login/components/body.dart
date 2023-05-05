import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sexylogin/Screens/DataPage/data_page.dart';
import 'package:sexylogin/Screens/Login/authentication.dart';
import 'package:sexylogin/Screens/Login/components/background.dart';
import 'package:sexylogin/Screens/sign%20up/components/signup_screen.dart';
import 'package:sexylogin/components/already_have_an_account_check.dart';
import 'package:sexylogin/components/rounded_button.dart';
import 'package:sexylogin/constraints.dart';
import 'package:sexylogin/components/text_field_container.dart';

import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';


class Body extends StatelessWidget {
  Body({
    super.key,
  });

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

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
              textEditingController: _email,
            ),
            RoundedPasswordField(
              onChanged: (
                value
              ) {},
              textEditingController: _password,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                print(_email.text);
                print(_password.text);
                if(autheniticate(_email, _password)) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataPage()));
                }
              },
              color: kPrimaryColor,
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => signUpScreen()));
              }
            ),
          ]
        ),
      ),
    );
  }
}

