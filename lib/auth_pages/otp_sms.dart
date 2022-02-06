import 'package:flutter/material.dart';
import 'package:untitled/auth_pages/profile.dart';

class OTPControllerSreen extends StatefulWidget {
  @override
  _OTPControllerSreenState createState() => _OTPControllerSreenState();
}

class _OTPControllerSreenState extends State<OTPControllerSreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController _pinOTPCodeController = TextEditingController();

  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? verificationCode;

  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Colors.grey),
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(''),
      ),
      body: Column(
        children: [
          SizedBox(height: 56),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: const Text(
                    "Верицикация",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              'Введите код отправленный на ваш номер',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
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
    );
  }
}
