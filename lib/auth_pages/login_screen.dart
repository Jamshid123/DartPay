import 'package:DartPay/main%20pages/home_screens/home_page.dart';
import 'package:DartPay/main%20pages/settings_screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:DartPay/start_pages/start_page.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

  bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Установите пароль',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'Mont',
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(left: 45),
                child: const Text(
                  "Ваш номер телефона",
                  style: kYourNumberStyle,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                height: 40,
                child: TextField(
                  cursorColor: greyColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: greyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: greyColor),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                ),
              ),
              const SizedBox(height: 13),
              Container(
                padding: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Пароль',
                  style: kYourNumberStyle,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  cursorColor: greyColor,
                  obscureText: isHidePassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: greyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: greyColor),
                    ),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(Icons.visibility),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/startPage');
                  },
                  child: const Text(
                    'Установить пароль',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gilroy-Regular',
                        letterSpacing: 1,
                        fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: orangeColor,
                    minimumSize: const Size(double.infinity, 45),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child:const Text(
                    'Пропустить',
                    style: TextStyle(
                        fontFamily: 'Gilroy-Regular',
                        color: orangeColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, elevation: 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }
}
