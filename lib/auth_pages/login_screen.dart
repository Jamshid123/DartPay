import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:untitled/start_pages/start_page.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Установите пароль',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'Mont',
                      letterSpacing: 1
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.47, left: 45),
                  child: Text(
                    "Ваш номер телефона",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45, right: screenWidth * 0.73),
                  child: Text('Пароль',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey)),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: TextField(
                    obscureText: isHidePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(Icons.visibility))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return StartPage();
                      }));
                    },
                    child: Text('Установить пароль', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy-Regular',
                      letterSpacing: 1,
                      fontSize: 18
                    ),),
                    style: ElevatedButton.styleFrom(
                        primary: orangeColor, minimumSize: Size(double.infinity, 45),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Пропустить',
                    style: TextStyle(
                      fontFamily: 'Gilroy-Regular',
                        color: orangeColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      letterSpacing: 1
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, elevation: 0),
                )
              ]),
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
