import 'package:flutter/material.dart';

class CardScanner extends StatefulWidget {
  const CardScanner({Key? key}) : super(key: key);

  @override
  _CardScannerState createState() => _CardScannerState();
}

class _CardScannerState extends State<CardScanner> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Scan'),
      ),
    );
  }
}
