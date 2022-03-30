import 'dart:async';

import 'package:DartPay/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class SuccessRequest extends StatelessWidget {
  const SuccessRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 226),
        child: Column(
          children: [
            Container(
              child: Center(child: Image.asset('assets/images/done.png')),
            ),
            const SizedBox(height: 24),
            const Text(
              'Запрос отправлен!',
              style: TextStyle(
                  fontFamily: 'Gilroy-Regular',
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            SizedBox(height: 150),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
                const Text(
                  'Поделиться ссылкой',
                  style: kShareTextStyle,
                ),
                SizedBox(height: 20),
                InkWell(
                  child: Text(
                    'https://cabinet.paymart.uz/ru/panel/buyers',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    launch('https://cabinet.paymart.uz/ru/panel/buyers');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}