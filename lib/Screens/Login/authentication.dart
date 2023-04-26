import 'package:flutter/material.dart';

bool autheniticate(TextEditingController _email, TextEditingController _password) {
  bool isGenuineUser = false;

  String genuineEmail = '1111';
  String genuinePassword = '123';

  String _emailText = _email.text;
  String _passwordText = _password.text;

  // print(' _emailText $_emailText');
  // print(' _passwordText $_passwordText');

  if(genuineEmail == _emailText && _passwordText == genuinePassword) 
    isGenuineUser = true;
  
  return isGenuineUser;
}