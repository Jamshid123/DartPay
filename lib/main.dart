import 'package:DartPay/auth_pages/login_screen.dart';
import 'package:DartPay/auth_pages/otp_sms.dart';
import 'package:DartPay/auth_pages/phone_add.dart';
import 'package:DartPay/main%20pages/home_screens/request_page/success_request.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/transfer_payment.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/payment_check.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/send_money.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/success_transfer.dart';
import 'package:DartPay/main%20pages/pinScreen.dart';
import 'package:DartPay/theme/themeData.dart';
import 'package:DartPay/theme/themePage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:DartPay/card_scan_page.dart';
import 'package:DartPay/main%20pages/home_screens/home_page.dart';
import 'package:DartPay/main%20pages/home_screens/request_page/request.dart';
import 'package:DartPay/main%20pages/settings_screens/card_add.dart';
import 'package:DartPay/auth_pages/profile.dart';
import 'package:DartPay/start_pages/language_page.dart';
import 'package:DartPay/main%20pages/settings_screens/settings.dart';
import 'package:DartPay/main%20pages/settings_screens/profile_change.dart';
import 'package:DartPay/main%20pages/settings_screens/security_settings.dart';
import 'package:DartPay/start_pages/start_page.dart';
import 'package:DartPay/translations/codegen_loader.g.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'start_pages/introduction_screen/intro.dart';

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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          routes: {
            '/': (context) => Intro(),
            '/language': (context) => Language(),
            '/phoneAdd': (context) => RegisterPhone(),
            '/otpSms': (context) => OTPControllerSreen(),
            '/profileCreate': (context) => Profile(),
            '/pinCodeScreen': (context) => PinCodeScreen(),
            // '/confirmPinCode': (context) => PinCodeScreen2(),
            '/loginScreen': (context) => LoginScreen(),
            '/startPage': (context) => StartPage(),
            '/homePage': (context) => HomePage(),
            '/requestPage': (context) => RequestPage(),
            '/successRequest': (context) => SuccessRequest(),
            '/sendMoney': (context) => SendMoney(),
            '/successTransfer': (context) => SuccessTransfer(),
            '/transferPayment': (context) => TransferPayment(),
            '/endCheck': (context) => EndCheck(),
            '/settings': (context) => Settings(),
            '/securitySettings': (context) => SecurityPage(),
            '/profileChange': (context) => ChangeProfile(),
            '/cardAdd': (context) => CardAdd(),
          },
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
        );
      },
    );
  }
}
