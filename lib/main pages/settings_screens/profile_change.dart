import 'package:DartPay/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum GenderType { male, female }

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  GenderType? gender;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    print(screenWidth);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/userAvatar_large.png'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Изменить фото',
                      style:
                          kChangePhotoStyle),
                    ),

                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.7),
                    child: Text(
                      'Имя',
                      style: kChangeNameStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.6),
                    child: Text(
                      'Фамилия',
                      style: kChangeNameStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.45),
                    child: Text(
                      'Дата рождения',
                      style: kChangeNameStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.7),
                    child: const Text(
                      'Пол',
                      style: kChangeNameStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
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
                            : greyColor,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'Мужчина',
                        style: kChangeNameStyle,
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                      ),
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
                            : greyColor,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      const Text(
                        'Женщина',
                        style: kChangeNameStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.55),
                    child: const Text(
                      'Ваш e-mail',
                      style: kChangeNameStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      decoration: InputDecoration(
                          label: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'user@dartpay.uz',
                              style: kChangeNameStyle,
                            ),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Сохранить'),
                    style: ElevatedButton.styleFrom(
                        primary: orangeColor,
                        fixedSize: Size(screenWidth * 0.8, 45)),
                  )
                ],
              ),
            ),
          ),
        ));
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
            shape:
                StadiumBorder(side: BorderSide(color: borderColor, width: 3)),
            onPressed: onTap,
            child: Icon(
              Icons.brightness_1_rounded,
              color: color,
              size: 50,
            )),
      ),
    );
  }
}
