import 'package:flutter/material.dart';
import 'package:sexylogin/components/text_field_container.dart';

import '../constraints.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  const RoundedPasswordField({
    super.key, 
    required this.onChanged, 
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          border: InputBorder.none,
          icon: Icon(
            Icons.lock, 
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility, 
            color: kPrimaryColor
          ),
        ),
      ),
    );
  }
}
