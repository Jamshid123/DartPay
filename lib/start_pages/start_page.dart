import 'package:DartPay/constants.dart';
import 'package:DartPay/main%20pages/settings_screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main pages/home_screens/home_page.dart';
import '../main pages/home_screens/send_money_pages/send_money.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _selectedScreen = 0;
  final List<Widget> _screens = [
    HomePage(),
    const SendMoney(),
    const Settings()
  ];

  Widget currentScreen = HomePage();
  PageStorageBucket bucket = PageStorageBucket();

  // @override
  // void initState() {
  //   super.initState();
  //
  //   Future.delayed(Duration.zero, () async {
  //     final prefs = await SharedPreferences.getInstance();
  //     final action = prefs.getString('pinCode');
  //
  //     screenLock(context: context,
  //       title: const Text(
  //         "Введите PIN-код",
  //         style: kSetPinStyle,
  //       ),
  //       correctString: action!,
  //       canCancel: false,
  //       confirmation: false,
  //       screenLockConfig: ScreenLockConfig(
  //         backgroundColor: Colors.white,
  //       ),
  //       secretsConfig: SecretsConfig(
  //         spacing: 15, // or spacingRatio
  //         padding: const EdgeInsets.all(40),
  //         secretConfig: SecretConfig(
  //           enabledColor: orangeColor,
  //           disabledColor: greyColor,
  //           borderColor: Colors.transparent,
  //           borderSize: 2.0,
  //           height: 15,
  //           width: 15,
  //           build: (context, {required config, required enabled}) {
  //             return SizedBox(
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: enabled ? config.enabledColor : config.disabledColor,
  //                   border: Border.all(
  //                     width: config.borderSize,
  //                     color: config.borderColor,
  //                   ),
  //                 ),
  //                 padding: EdgeInsets.all(10),
  //                 width: config.width,
  //                 height: config.height,
  //               ),
  //               width: config.width,
  //               height: config.height,
  //             );
  //           },
  //         ),
  //       ),
  //       inputButtonConfig: InputButtonConfig(
  //         textStyle: InputButtonConfig.getDefaultTextStyle(context).copyWith(
  //           color: orangeColor,
  //           fontSize: 32,
  //           fontWeight: FontWeight.w400,
  //         ),
  //         buttonStyle: TextButton.styleFrom(
  //           side: BorderSide(color: orangeColor),
  //           shape:
  //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  //           backgroundColor: Colors.white,
  //         ),
  //       ),
  //       deleteButton: const Icon(
  //         Icons.backspace_outlined,
  //         color: orangeColor,
  //       ),
  //     );
  //   });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        backgroundColor: orangeColor,
        onPressed: () {
          Navigator.pushNamed(context, '/sendMoney');
        },
        child: const ImageIcon(
          AssetImage('assets/images/arrow_icon.png'),
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(
                    () {
                      _selectedScreen = 0;
                      currentScreen = HomePage();
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_rounded,
                      color: _selectedScreen == 0 ? orangeColor : greyColor,
                    ),
                    Text(
                      'Главная',
                      style: TextStyle(
                        fontFamily: 'Mont',
                        fontWeight: FontWeight.w500,
                        color: _selectedScreen == 0 ? orangeColor : greyColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 15),
                child: Text(
                  'Переводы',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontWeight: FontWeight.w500,
                    color: _selectedScreen == 1 ? orangeColor : greyColor,
                    fontSize: 12,
                  ),
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(
                    () {
                      _selectedScreen = 2;
                      currentScreen = const Settings();
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: _selectedScreen == 2 ? orangeColor : greyColor,
                    ),
                    Text(
                      'Настройки',
                      style: TextStyle(
                        fontFamily: 'Mont',
                        fontWeight: FontWeight.w500,
                        color: _selectedScreen == 2 ? orangeColor : greyColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
