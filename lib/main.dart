import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:untitled/card_scan_page.dart';
import 'package:untitled/main%20pages/home_screens/home_page.dart';
import 'package:untitled/main%20pages/home_screens/request_page/request.dart';
import 'package:untitled/main%20pages/settings_screens/card_add.dart';
import 'package:untitled/auth_pages/profile.dart';
import 'package:untitled/start_pages/introduction_screen/intro.dart';
import 'package:untitled/start_pages/language_page.dart';
import 'package:untitled/main%20pages/settings_screens/settings.dart';
import 'package:untitled/main%20pages/settings_screens/profile_change.dart';
import 'package:untitled/request_page/request.dart';
import 'package:untitled/main%20pages/settings_screens/security_settings.dart';
import 'package:untitled/start_pages/start_page.dart';
import 'package:untitled/translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('ru'), Locale('uz')],
      fallbackLocale: Locale('ru'),
      assetLoader: CodegenLoader(),
      path: 'assets/translations',
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(400, name: MOBILE),
          ResponsiveBreakpoint.autoScale(640, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      home: Scaffold(
        body: Intro(),
      ),
    );
  }
}
