
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:DartPay/constants.dart';
import 'package:DartPay/start_pages/introduction_screen/intro.dart';
import '../main.dart';
import '../translations/locale_keys.g.dart';

enum LangType {
  rus,
uz
}


class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {

  LangType? langType;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: orangeColor,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Выберите язык', style: kLangChoose,),
              SizedBox(height: 50,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: langType == LangType.rus ? Colors.white : orangeColor,
                    fixedSize: Size(120, 40),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                  onPressed: () async{
                    setState(() {
                      langType = LangType.rus;
                    });
                await context.setLocale(Locale("ru"));
              }, child: Text('Русский', style: TextStyle(color: langType == LangType.rus ? orangeColor : Colors.white, letterSpacing: 1),)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: langType == LangType.uz ? Colors.white : orangeColor,
                      fixedSize: Size(120, 40),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    onPressed: () async{
                      setState(() {
                        langType = LangType.uz;
                      });
                  await context.setLocale(Locale("uz"));

                }, child: Text('Ozbek tili', style: TextStyle(color: langType == LangType.uz ? orangeColor : Colors.white,letterSpacing: 1 ),)),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
