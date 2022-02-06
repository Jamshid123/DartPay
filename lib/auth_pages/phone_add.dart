import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:untitled/auth_pages/otp_sms.dart';
import 'package:untitled/auth_pages/success_transfer.dart';

import '../constants.dart';

class RegisterPhone extends StatefulWidget {
  const RegisterPhone({Key? key}) : super(key: key);

  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 67),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('images/logo Dartpay horizontal 1.png'),
                SizedBox(height: 50),
                Text(
                  'Введите номер вашего телефона',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber value) {},
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPControllerSreen()));
                      },
                      child: Text('Продолжить'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          fixedSize: Size(screenWidth * 0.91, 50)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Авторизуясь, Вы соглашаетесь с',
                  style: kIntroductionScreenStyle2,
                ),
                InkWell(
                  child: const Text(
                    'Публичной офертой',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontFamily: 'Gilroy-Regular'),
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
