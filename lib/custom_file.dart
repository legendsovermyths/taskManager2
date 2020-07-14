import 'package:flutter/material.dart';
class CustomButtom extends StatelessWidget {
  CustomButtom({this.buttonText,this.onPressed,this.color,this.bordercolor,this.textcolor});
  final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  final Color bordercolor;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: bordercolor),

          borderRadius: BorderRadius.circular(15)),

      color: color,
      padding: EdgeInsets.all(14.0),
      onPressed:onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: textcolor),
      ),
    );
  }
}
