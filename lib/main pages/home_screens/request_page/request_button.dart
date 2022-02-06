import 'package:flutter/material.dart';
import '../constants.dart';

class RequestButton extends StatelessWidget {
  final VoidCallback onPress;
  final Color colour;
  final Text data;
  RequestButton({required this.colour, required this.data, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: data),
      ),
    );
  }
}
