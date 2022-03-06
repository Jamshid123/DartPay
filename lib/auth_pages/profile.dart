import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import '../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum GenderType { male, female }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GenderType? gender;

  final _controller = MaskedTextController(mask: '00.00.0000');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text(
                  'Создайте профиль',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                      letterSpacing: 1,
                      fontFamily: 'Gilroy-Regular'),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      cursorColor: greyColor,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: greyColor),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        label: Text(
                          'Имя',
                          style: kChangeNameStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      cursorColor: greyColor,

                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: greyColor),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        label: Text(
                          'Фамилия',
                          style: kChangeNameStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      cursorColor: greyColor,
                      style: const TextStyle(fontSize: 18),
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: greyColor),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        label: Text(
                          'Дата рождения',
                          style: kChangeNameStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.7),
                child: const Text(
                  'Пол',
                  style: kChangeNameStyle,
                ),
              ),
              const SizedBox(height: 16.0),
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
                        : greyColor,
                  ),
                  const SizedBox(width: 9),
                  const Text(
                    'Мужчина',
                    style: kChangeNameStyle,
                  ),
                  SizedBox(width: screenWidth * 0.2),
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
                  const SizedBox(width: 9),
                  const Text(
                    'Женщина',
                    style: kChangeNameStyle,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {

                 buildScreenLock(context);
                },
                child: const Text(
                  'Создать профиль',
                  style: kProfileCreateButton,
                ),
                style: ElevatedButton.styleFrom(
                    primary: orangeColor,
                    shadowColor: orangeColor,
                    elevation: 5,
                    fixedSize: Size(screenWidth * 0.8, 45)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildScreenLock(BuildContext context) async {

    final inputController = InputController();
    screenLock(
      context: context,
      title: const Text(
        "Установите PIN-код",
        style: kSetPinStyle,
      ),
      confirmTitle: const Text(
        "Подтвердите PIN-код",
        style: kSetPinStyle,
      ),
      correctString: '',
      inputController: inputController,
      confirmation: true,
      didConfirmed: (matchedText) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('pinCode', matchedText);
        Navigator.pushNamed(context, '/loginScreen');
      },
      screenLockConfig: ScreenLockConfig(
        backgroundColor: Colors.white,
      ),
      secretsConfig: SecretsConfig(
        spacing: 15, // or spacingRatio
        padding: const EdgeInsets.all(40),
        secretConfig: SecretConfig(
          enabledColor: orangeColor,
          disabledColor: greyColor,
          borderColor: Colors.transparent,
          borderSize: 2.0,
          height: 15,
          width: 15,
          build: (context, {required config, required enabled}) {
            return SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: enabled ? config.enabledColor : config.disabledColor,
                  border: Border.all(
                    width: config.borderSize,
                    color: config.borderColor,
                  ),
                ),
                padding: EdgeInsets.all(10),
                width: config.width,
                height: config.height,
              ),
              width: config.width,
              height: config.height,
            );
          },
        ),
      ),
      inputButtonConfig: InputButtonConfig(
        textStyle: InputButtonConfig.getDefaultTextStyle(context).copyWith(
          color: orangeColor,
          fontSize: 32,
          fontWeight: FontWeight.w400,
        ),
        buttonStyle: TextButton.styleFrom(
          side: BorderSide(color: orangeColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.white,
        ),
      ),
      cancelButton: const Icon(
        Icons.close,
        color: orangeColor,
      ),
      deleteButton: const Icon(
        Icons.backspace_outlined,
        color: orangeColor,
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
