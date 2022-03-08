import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';
import 'package:DartPay/auth_pages/phone_add.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              Navigator.pushNamed(context, '/phoneAdd');
            },
            child: const Text('Авторизация'),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFF37547),
              fixedSize: const Size(336, 45),
              textStyle: kManualStyle,
            ),
          ),
          decoration: const PageDecoration(
            titleTextStyle: kIntroductionScreen1Style,
            bodyTextStyle: kIntroductionScreenStyle2,
            titlePadding: EdgeInsets.only(
              top: 55.0,
            ),
            descriptionPadding: EdgeInsets.only(top: 50.0),
          ),
        ),
        PageViewModel(
          image: Image.asset('assets/images/intscr2.png'),
          title: 'Минимальная комиссия',
          body: 'Комиссия переводов всего 1% на карты любых банков России',
          footer: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/phoneAdd');
            },
            child: const Text('Авторизация'),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFF37547),
              fixedSize: const Size(336, 45),
              textStyle: kManualStyle,
            ),
          ),
          decoration:const PageDecoration(
            titleTextStyle: kIntroductionScreen1Style,
            bodyTextStyle: kIntroductionScreenStyle2,
            titlePadding: EdgeInsets.only(top: 55.0),
            descriptionPadding: EdgeInsets.only(top: 40.0),
            footerPadding: EdgeInsets.only(top: 55.0),
          ),
        ),
        PageViewModel(
          image: Image.asset('assets/images/intscr3.png'),
          title: 'Деньги защищены',
          body: 'Мы используем 3d secure - надёжная защита ваших средств',
          footer: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/phoneAdd');
            },
            child: const Text('Авторизация'),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFF37547),
              fixedSize: const Size(336, 45),
              textStyle: kManualStyle,
            ),
          ),
          decoration: const PageDecoration(
            titleTextStyle: kIntroductionScreen1Style,
            bodyTextStyle: kIntroductionScreenStyle2,
            titlePadding: EdgeInsets.only(
              top: 55.0,
            ),
            descriptionPadding: const EdgeInsets.only(top: 40.0),
            footerPadding: const EdgeInsets.only(top: 55.0),
          ),
        ),
      ],
      showDoneButton: false,
      showNextButton: false,
      showSkipButton: false,
      dotsDecorator: const DotsDecorator(
        color: const Color(0xFFE5E5E5),
        activeColor: const Color(0xFFF37547),
      ),
    );
  }
}
