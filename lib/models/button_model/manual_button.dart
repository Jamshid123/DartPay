import 'package:flutter/material.dart';
import 'package:DartPay/constants.dart';

class ManualButton extends StatelessWidget {
  final String  title;
  final VoidCallback onPressed;

  ManualButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: EdgeInsets.only(left: 40, right: 40),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xfffcdcd1),
            blurRadius: 20,
            offset: Offset(-12, 12),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child:  Text(
          title,
          style: kProfileCreateButton,
        ),
        style: ElevatedButton.styleFrom(
          primary: orangeColor,
          // shadowColor: orangeColor,
          // elevation: 15,
        ),
      ),
    );
  }
}