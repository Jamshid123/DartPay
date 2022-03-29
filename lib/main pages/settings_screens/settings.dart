import 'package:DartPay/theme/themeData.dart';
import 'package:DartPay/theme/themeSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
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
   bool value = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF8FBFF),
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
                    child: Text('Изменить профиль', style: kChangeProfileSettingsStyle,),
                  ),
                  Container(
                    height: screenHeight * 0.5,
                    child: ListView(
                      children: [
                        SettingsButton(
                          label: Text(
                            'Безопастность',
                            style: kSettingsButton,
                          ),
                          icon: SvgPicture.asset('assets/svg/lock.svg'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/securitySettings');
                          },
                        ),
                        const SizedBox(height: 10),
                        SettingsButton(
                          label: Text(
                            'Язык',
                            style: kSettingsButton,
                          ),
                          icon: SvgPicture.asset('assets/svg/globe.svg'),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0.25,
                              shadowColor: greyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/moon.svg'),
                                      SizedBox(width: 15),
                                      const Text(
                                        'Тёмный режим',
                                        style: kSettingsButton,
                                      ),
                                    ],
                                  ),
                                ),
                                Switch.adaptive(
                                  value: themeProvider.isDarkMode,
                                  onChanged: (value) {
                                  final provider = Provider.of<ThemeProvider>(context, listen: false);
                                  provider.toggleTheme(value);
                                },)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0.25,
                              shadowColor: greyColor,
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
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/bell.svg'),
                                      SizedBox(width: 15),
                                      const Text(
                                        'Уведомления',
                                        style: kSettingsButton,
                                      ),
                                    ],
                                  ),
                                ),
                                Switch.adaptive(
                                    value: value, onChanged: (newValue){
                                  value = newValue;
                                },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SettingsButton(
                          label: Text(
                            'Добавить контакт',
                            style: kSettingsButton,
                          ),
                          icon: SvgPicture.asset('assets/svg/user_plus.svg'),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        SettingsButton(
                          label: Text(
                            'Добавить карту',
                            style: kSettingsButton,
                          ),
                          icon: SvgPicture.asset('assets/svg/credit-card.svg'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cardAdd');
                          },
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0.25,
                              shadowColor: greyColor,
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
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/message_circle.svg'),
                                      SizedBox(width: 15),
                                      const Text(
                                        'Служба поддержки',
                                        style: kSettingsButton,
                                      ),
                                    ],
                                  ),
                                ),
                               SvgPicture.asset('assets/svg/telegramm.svg'),
                              ],
                            ),
                          ),
                        ),
                       TextButton(onPressed: (){}, child: Text('Выйти из аккаунта', style: kQuitButtonStyle,))

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
