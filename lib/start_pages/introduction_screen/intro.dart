import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';
import 'package:DartPay/auth_pages/phone_add.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            image: Image.asset('assets/images/intrscr1.png'),
            title: 'Быстро.Просто.Удобно.',
            body: 'Прямые переводы в Россию с карт Uzcard и Humo. '
                'Отправляй деньги на банковские карты России.',
            footer: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/phoneAdd');
              },
              child: Text('Авторизация'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF37547),
                fixedSize: Size(336, 45),
                textStyle: kButtonTextStyle,
              ),
            ),
            decoration: PageDecoration(
                titleTextStyle: kIntroductionScreen1Style,
                bodyTextStyle: kIntroductionScreenStyle2,
                titlePadding: EdgeInsets.only(
                  top: 55.0,
                ),
                descriptionPadding: EdgeInsets.only(top: 50.0),),),
        PageViewModel(
            image: Image.asset('assets/images/intscr2.png'),
            title: 'Минимальная комиссия',
            body: 'Комиссия переводов всего 1% на карты любых банков России',
            footer: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/phoneAdd');
              },
              child: Text('Авторизация'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF37547),
                fixedSize: Size(336, 45),
                textStyle: kButtonTextStyle,
              ),
            ),
            decoration: PageDecoration(
                titleTextStyle: kIntroductionScreen1Style,
                bodyTextStyle: kIntroductionScreenStyle2,
                titlePadding: EdgeInsets.only(
                  top: 55.0,
                ),
                descriptionPadding: EdgeInsets.only(top: 40.0),
                footerPadding: EdgeInsets.only(top: 55.0),),),
        PageViewModel(
            image: Image.asset('assets/images/intscr3.png'),
            title: 'Деньги защищены',
            body: 'Мы используем 3d secure - надёжная защита ваших средств',
            footer: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/phoneAdd');

              },
              child: Text('Авторизация'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF37547),
                fixedSize: Size(336, 45),
                textStyle: kButtonTextStyle,
              ),
            ),
            decoration: PageDecoration(
                titleTextStyle: kIntroductionScreen1Style,
                bodyTextStyle: kIntroductionScreenStyle2,
                titlePadding: EdgeInsets.only(
                  top: 55.0,
                ),
                descriptionPadding: EdgeInsets.only(top: 40.0),
                footerPadding: EdgeInsets.only(top: 55.0),),),
      ],
      showDoneButton: false,
      showNextButton: false,
      showSkipButton: false,
      dotsDecorator: DotsDecorator(
        color: Color(0xFFE5E5E5),
        activeColor: Color(0xFFF37547),
      ),
    );
  }

  buildScreenLock(BuildContext context) async {


    screenLock(context: context,
      title: Text(
        "Установите PIN-код",
        style: kSetPinStyle,
      ),
      confirmTitle: Text(
        "Подтвердите PIN-код",
        style: kSetPinStyle,
      ),
      correctString: '',

      confirmation: true,
      didConfirmed: (matchedText) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('pinCode', matchedText);
        Navigator.pushNamed(context, '/sendMoney');
      },
      screenLockConfig: ScreenLockConfig(
        backgroundColor: Colors.white,
      ),
      secretsConfig: SecretsConfig(
        spacing: 15, // or spacingRatio
        padding: const EdgeInsets.all(40),
        secretConfig: SecretConfig(
          enabledColor: orangeColor,
          disabledColor: greyColor,
          borderColor: Colors.transparent,
          borderSize: 2.0,
          height: 15,
          width: 15,
          build: (context, {required config, required enabled}) {
            return SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: enabled ? config.enabledColor : config.disabledColor,
                  border: Border.all(
                    width: config.borderSize,
                    color: config.borderColor,
                  ),
                ),
                padding: EdgeInsets.all(10),
                width: config.width,
                height: config.height,
              ),
              width: config.width,
              height: config.height,
            );
          },
        ),
      ),
      inputButtonConfig: InputButtonConfig(
        textStyle: InputButtonConfig.getDefaultTextStyle(context).copyWith(
          color: orangeColor,
          fontSize: 32,
          fontWeight: FontWeight.w400,
        ),
        buttonStyle: TextButton.styleFrom(
          side: BorderSide(color: orangeColor),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.white,
        ),
      ),
      cancelButton: const Icon(
        Icons.close,
        color: orangeColor,
      ),
      deleteButton: const Icon(
        Icons.backspace_outlined,
        color: orangeColor,
      ),
    );

  }
}
