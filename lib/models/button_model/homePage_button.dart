import 'package:flutter/material.dart';
import 'package:DartPay/constants.dart';



class HomePageButton extends StatelessWidget {
  final VoidCallback onPress;
  final Color colour;
  final Text data;
   const HomePageButton({required this.colour, required this.data, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 160,
        height: 40,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: orangeColor, width: 1),
        ),
        child: Center(child: data),
      ),
    );
  }
}
