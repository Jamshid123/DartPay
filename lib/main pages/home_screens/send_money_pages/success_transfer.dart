import 'dart:async';

import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';

class SuccessTransfer extends StatelessWidget {
  const SuccessTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 800), () {
      Navigator.pushNamed(context, '/endCheck');
    });
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/done.png'),
              SizedBox(height: 42),
              const Text(
                'Успешно!',
                style: kSuccessTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
