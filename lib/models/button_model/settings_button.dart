import 'package:DartPay/constants.dart';
import 'package:DartPay/theme/themeData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SettingsButton extends StatefulWidget {
  const SettingsButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Widget label;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: 50,
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0.25),
          shadowColor: MaterialStateProperty.all(greyColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),),
        ),
        child: Row(
          children: [
            widget.icon,
            const SizedBox(width: 20),
            widget.label
          ],
        ),
      ),
    );
  }
}