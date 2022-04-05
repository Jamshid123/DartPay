import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_svg/svg.dart';

class CardAdd extends StatefulWidget {
  const CardAdd({Key? key}) : super(key: key);

  @override
  _CardAddState createState() => _CardAddState();
}

class _CardAddState extends State<CardAdd> {
  var _controllerYear = new MaskedTextController(mask: '00/00');
  var _controllerNum = MaskedTextController(mask: '0000 0000 0000 0000');
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: SvgPicture.asset('assets/svg/vector_left.svg')),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Добавить карту',
            style: kAddCard,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                height: 280,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                            label: Text('Введите номер карты',
                                style: kCardAddStyle)),
                        keyboardType: TextInputType.number,
                        controller: _controllerNum,
                      ),
                      TextFormField(
                          controller: _controllerYear,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text('ММ/ГГ', style: kCardAddStyle),
                          )),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Название карты', style: kCardAddStyle),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Сделать карту основной', style: kMainCardStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: orangeColor),
                  onPressed: () {

                  },
                  child: Text(
                    'Добавить',
                    style: kAddCardButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

