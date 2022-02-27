import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';
import 'package:DartPay/auth_pages/phone_add.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatelessWidget {
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
}
