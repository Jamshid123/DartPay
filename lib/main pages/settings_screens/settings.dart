import 'package:DartPay/theme/themeSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../constants.dart';
import 'card_add.dart';
import 'profile_change.dart';
import 'security_page/security_settings.dart';
import 'settings_button.dart';

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth,
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/background_image_settings.png',
                        fit: BoxFit.fill,
                      ),
                      width: screenWidth,
                    ),
                    Positioned(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 78),
                          child: Image.asset(
                              'assets/images/userAvatar_settings.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Bayahmedov S.R',
                    style: kSettingsUserStyle,
                  ),
                  const Text(
                    '+998 90 900 90 90',
                    style: kSettingsNumStyle,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: orangeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fixedSize: const Size(170, 30),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profileChange');
                    },
                    child: Text('Изменить профиль'),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: screenHeight * 0.44,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        SettingsButton(
                          label: 'Безопастность',
                          icon: const Icon(
                            Icons.lock_outline,
                            color: orangeColor,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/securitySettings');
                          },
                        ),
                        const SizedBox(height: 10),
                        SettingsButton(
                          label: 'Язык',
                          icon: const ImageIcon(
                            AssetImage(
                              'assets/images/icon_globe.png',
                            ),
                            color: orangeColor,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0.25,
                            shadowColor: greyColor,
                            fixedSize: Size(screenWidth * 0.9, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: const [
                                    ImageIcon(
                                      AssetImage('assets/images/icon_moon.png'),
                                      color: orangeColor,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Тёмный режим',
                                      style: kSettingsButton,
                                    ),
                                  ],
                                ),
                              ),
                              SwitchButton(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0.25,
                            shadowColor: greyColor,
                            fixedSize: Size(screenWidth * 0.9, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: const [
                                    ImageIcon(
                                      AssetImage('assets/images/icon_bell.png'),
                                      color: orangeColor,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Уведомления',
                                      style: kSettingsButton,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SettingsButton(
                          label: 'Добавить контакт',
                          icon: const Icon(
                            Icons.person_add_alt_1,
                            color: orangeColor,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        SettingsButton(
                          label: 'Добавить карту',
                          icon: const Icon(
                            Icons.credit_card,
                            color: orangeColor,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cardAdd');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


