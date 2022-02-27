import 'package:DartPay/theme/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return FlutterSwitch(
      width: 50,
      height: 30,
      inactiveColor: Color(0xFFDADADA),
      activeColor: Colors.grey.shade900,
      value: themeProvider.isDarkMode,
      padding: 2,
      onToggle: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },

    );
  }
}
