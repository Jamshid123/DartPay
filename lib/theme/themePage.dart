import 'package:DartPay/theme/themeSwitch.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Title'),
        actions: [
          SwitchButtonTheme()
        ],
      ),
      body: Center(
        child: Text(
          'HELLO!',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
