import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/start_pages/start_page.dart';
import 'package:untitled/translations/locale_keys.g.dart';
import '../../constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          image: Image.asset('assets/images/intrscr1.png'),
            body: "Прямые переводы в Россию с карт Uzcard и Humo. Отправляй деньги на банковские карты России.",
            title: LocaleKeys.int_screen1.tr(),

            footer: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StartPage();
                }));
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
                descriptionPadding: EdgeInsets.only(top: 50.0))),
        PageViewModel(
            image: Image.asset('assets/images/intscr2.png'),
            title: 'Минимальная комиссия',
            body: 'Комиссия переводов всего 1% на карты любых банков России',
            footer: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StartPage();
                }));
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
                footerPadding: EdgeInsets.only(top: 55.0))),
        PageViewModel(
            image: Image.asset('assets/images/intscr3.png'),
            title: 'Деньги защищены',
            body: 'Мы используем 3d secure - надёжная защита ваших средств',
            footer: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StartPage();
                }));
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
                footerPadding: EdgeInsets.only(top: 55.0))),
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