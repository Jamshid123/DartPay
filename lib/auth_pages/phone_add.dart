import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:untitled/auth_pages/otp_sms.dart';

import '../constants.dart';

class RegisterPhone extends StatefulWidget {
  const RegisterPhone({Key? key}) : super(key: key);

  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'UZ';
  PhoneNumber number = PhoneNumber(isoCode: 'UZ');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    print(screenWidth);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
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
                          textFieldController: controller,
                          initialValue: number,
                          hintText: 'Номер телефона',
                          countries: ['UZ', 'RU'],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPControllerSreen()));
                      },
                      child: Text('Продолжить', style: TextStyle(
                        fontFamily: 'Gilroy-Regular',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2
                      ),),
                      style: ElevatedButton.styleFrom(
                          primary: orangeColor, fixedSize: Size(280, 50)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.07,),
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
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }
}