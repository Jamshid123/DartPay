import 'package:DartPay/auth_pages/profile.dart';
import 'package:DartPay/main%20pages/home_screens/home_page/home_page.dart';
import 'package:DartPay/main%20pages/settings_screens/settings.dart';
import 'package:DartPay/models/button_model/manual_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:DartPay/start_pages/start_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
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
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kTextFieldBorderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kTextFieldBorderColor),
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
                  decoration:  InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kTextFieldBorderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kTextFieldBorderColor),
                    ),
                    suffixIcon: IconButton(onPressed: _togglePasswordView, icon: SvgPicture.asset('assets/svg/eye.svg')),
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              ManualButton(title: 'Установить пароль', onPressed: (){
                Navigator.pushNamed(context, '/startPage');
              }),

              const SizedBox(height: 25),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/startPage');
                  },
                  child:const Text(
                    'Пропустить',
                    style: kSkipButtonTextStyle,
                  ),
                  style: TextButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                  ),
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
