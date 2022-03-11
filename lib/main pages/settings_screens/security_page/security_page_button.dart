import 'package:flutter/material.dart';
import 'package:DartPay/constants.dart';



class SecurityPageButton extends StatefulWidget {
  const SecurityPageButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  State<SecurityPageButton> createState() => _SecurityPageButtonState();
}

class _SecurityPageButtonState extends State<SecurityPageButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0.25,
        shadowColor: greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          widget.icon,
          const SizedBox(width: 20),
          Text(
            widget.label,
            style: kSettingsButton,
          ),
        ],
      ),
    );
  }
}