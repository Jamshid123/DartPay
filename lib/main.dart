import 'package:DartPay/auth_pages/login_screen.dart';
import 'package:DartPay/auth_pages/otp_sms.dart';
import 'package:DartPay/auth_pages/phone_add.dart';
import 'package:DartPay/main%20pages/home_screens/request_page/success_request.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/transfer_payment.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/payment_check.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/send_money.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/success_transfer.dart';
import 'package:DartPay/test_page.dart';
import 'package:DartPay/theme/themeData.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:DartPay/main%20pages/home_screens/home_page/home_page.dart';
import 'package:DartPay/main%20pages/home_screens/request_page/request.dart';
import 'package:DartPay/main%20pages/settings_screens/card_add.dart';
import 'package:DartPay/auth_pages/profile.dart';
import 'package:DartPay/start_pages/language_page.dart';
import 'package:DartPay/main%20pages/settings_screens/settings.dart';
import 'package:DartPay/main%20pages/settings_screens/profile_change.dart';
import 'package:DartPay/main%20pages/settings_screens/security_page/security_settings.dart';
import 'package:DartPay/start_pages/start_page.dart';
import 'package:DartPay/translations/codegen_loader.g.dart';
import 'start_pages/introduction_screen/intro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ru'), Locale('uz')],
      fallbackLocale: const Locale('ru'),
      assetLoader: const CodegenLoader(),
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
            '/': (context) => Profile(),
            '/language': (context) => const Language(),
            '/phoneAdd': (context) => const RegisterPhone(),
            '/otpSms': (context) => OTPControllerSreen(),
            '/profileCreate': (context) => Profile(),
            '/loginScreen': (context) => LoginScreen(),
            '/startPage': (context) => StartPage(),
            '/homePage': (context) => HomePage(),
            '/requestPage': (context) => const RequestPage(),
            '/successRequest': (context) => const SuccessRequest(),
            '/sendMoney': (context) => const SendMoney(),
            '/successTransfer': (context) => const SuccessTransfer(),
            '/transferPayment': (context) => const TransferPayment(),
            '/endCheck': (context) => const EndCheck(),
            '/settings': (context) => const Settings(),
            '/securitySettings': (context) => const SecurityPage(),
            '/profileChange': (context) => const ChangeProfile(),
            '/cardAdd': (context) => const CardAdd(),
          },
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(400, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(640, name: TABLET),
              const ResponsiveBreakpoint.resize(800, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ],
          ),
        );
      },
    );
  }
}
