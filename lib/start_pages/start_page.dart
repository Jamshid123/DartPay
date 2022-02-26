import 'package:DartPay/constants.dart';
import 'package:DartPay/main%20pages/settings_screens/settings.dart';
import 'package:flutter/material.dart';
import '../main pages/home_screens/home_page.dart';
import '../main pages/home_screens/send_money_pages/send_money.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _selectedScreen = 0;
  final List<Widget> _screens = [HomePage(), const SendMoney(), const Settings()];
  Widget currentScreen = HomePage();
  PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _selectedScreen == 1 ? orangeColor : greyColor,
        onPressed: () {
          setState(() {
            _selectedScreen = 1;
            currentScreen = const SendMoney();
          });
        },
        child: const ImageIcon(
          AssetImage('assets/images/arrow_icon.png'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
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
                  setState(() {
                    _selectedScreen = 0;
                    currentScreen = HomePage();
                  });
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
                    )
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
                  )),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _selectedScreen = 2;
                    currentScreen = const Settings();
                  });
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
                    )
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
