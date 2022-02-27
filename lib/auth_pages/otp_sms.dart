import 'package:DartPay/auth_pages/profile.dart';
import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OTPControllerSreen extends StatefulWidget {
  @override
  _OTPControllerSreenState createState() => _OTPControllerSreenState();
}

class _OTPControllerSreenState extends State<OTPControllerSreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController _pinOTPCodeController = TextEditingController();

  final FocusNode _pinOTPCodeFocus = FocusNode();

  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Colors.grey),
  );

  String? currentText;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 41, top: screenHeight * 0.19),
              child: Text(
                "Верификация",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: 10
            ),
            Padding(
              padding: EdgeInsets.only(left: 41),
              child: Text(
                'Введите код отправленный на ваш номер',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 30
            ),
            Padding(
              padding: const EdgeInsets.only(left: 41, right: 41),
              child: Form(
                  child: PinCodeTextField(
                pinTheme: PinTheme(
                    selectedColor: Colors.grey,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white),
                keyboardType: TextInputType.number,
                appContext: context,
                length: 4,
                enableActiveFill: false,
                cursorColor: Colors.black,
                boxShadows: [BoxShadow(color: Colors.white)],
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 41),
              child: Row(
                children: [
                  Text(
                    'Не получили код?',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Отправьте снова',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),),
                ],
              ),
            ),
            SizedBox(
              height: 10
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'/profileCreate');
                },
                child: Text(
                  'Продолжить',
                  style: kManualStyle,
                ),
                style: ElevatedButton.styleFrom(
                    primary: orangeColor,
                    minimumSize: Size(double.infinity, 45)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
