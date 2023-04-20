import 'package:flutter/material.dart';
import 'package:sexylogin/constraints.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final Color color, textColor;
  final VoidCallback press;

  const RoundedButton({
    super.key, 
    required this.text, 
    required this.color, 
    this.textColor = Colors.white, 
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29)
            ),
          ),
          padding: MaterialStateProperty.all<
            EdgeInsets
          >(
            const EdgeInsets.symmetric(
              vertical: 20, 
              horizontal: 40
            )
          )
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

