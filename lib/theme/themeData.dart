import 'package:flutter/material.dart';



class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn){
   themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
   notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    primaryColor: Colors.black,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent

  );


static final lightTheme = ThemeData(
scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(),
  primaryColor: Colors.white,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent
);
}