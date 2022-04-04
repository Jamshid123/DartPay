import 'package:DartPay/auth_pages/profile.dart';
import 'package:DartPay/constants.dart';
import 'package:DartPay/models/button_model/manual_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

enum GenderType { male, female }

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  GenderType? gender;
  final  _dateController = MaskedTextController(mask: '00 . 00 . 0000');
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                      AssetImage('assets/images/userAvatar_large.png'),
                    ),
                    TextButton(
                        onPressed: () {},
                        child:
                        const Text('Изменить фото', style: kChangePhotoStyle),
                        style: TextButton.styleFrom(
                          primary: greyColor,
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.7),
                  child: const Text(
                    'Имя',
                    style: kChangeNameStyle,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: const TextField(
                    style: kInputTextStyleProfileChangePage,
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextFieldBorderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextFieldBorderColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.6),
                  child: const Text(
                    'Фамилия',
                    style: kChangeNameStyle,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: const TextField(
                    style: kInputTextStyleProfileChangePage,
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextFieldBorderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextFieldBorderColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.45),
                  child: const Text(
                    'Дата рождения',
                    style: kChangeNameStyle,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child:  TextField(
                    controller: _dateController,
                    style: kInputTextStyleProfileChangePage,
                    cursorColor: greyColor,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextFieldBorderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextFieldBorderColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.7),
                  child: const Text(
                    'Пол',
                    style: kChangeNameStyle,
                  ),
                ),
                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenderButton(
                      color: gender == GenderType.male
                          ? activeButtonColor
                          : Colors.white70,
                      onTap: () {
                        setState(() {
                          gender = GenderType.male;
                        });
                      },
                      borderColor: gender == GenderType.male
                          ? activeButtonColor
                          : const Color(0xFF979797),
                    ),
                    const SizedBox(width: 9),
                    const Text(
                      'Мужчина',
                      style: kChangeNameStyle,
                    ),
                    SizedBox(width: screenWidth * 0.3),
                    GenderButton(
                      onTap: () {
                        setState(() {
                          gender = GenderType.female;
                        });
                      },
                      color: gender == GenderType.female
                          ? activeButtonColor
                          : Colors.white70,
                      borderColor: gender == GenderType.female
                          ? activeButtonColor
                          : const Color(0xFF979797),
                    ),
                    const SizedBox(width: 9),
                    const Text(
                      'Женщина',
                      style: kChangeNameStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.55),
                  child: const Text(
                    'Ваш e-mail',
                    style: kChangeNameStyle,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: const TextField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      label: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'user@dartpay.uz',
                          style: kChangeNameStyle,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextFieldBorderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextFieldBorderColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
               ManualButton(title: 'Сохранить', onPressed: (){Navigator.pop(context);})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton({
    Key? key,
    required this.color,
    required this.onTap,
    required this.borderColor,
  }) : super(key: key);
  final Color color;
  final VoidCallback onTap;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: const Color(0xFFF8FBFF),
          shape: StadiumBorder(
            side: BorderSide(color: borderColor, width: 3),
          ),
          onPressed: onTap,
          child: Icon(
            Icons.brightness_1_rounded,
            color: color,
            size: 50,
          ),
        ),
      ),
    );
  }
}
