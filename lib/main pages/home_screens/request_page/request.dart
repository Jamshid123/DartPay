import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/main%20pages/home_screens/request_page/request_button.dart';
import 'package:untitled/main%20pages/home_screens/request_page/success_request.dart';
import 'package:untitled/models/card_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../transfer_page.dart';

enum SendType {
  sendRequest,
  textRequest,
}

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  SendType? typeRequest;
  SendType? textTypeRequest;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey,
              child: const Center(
                child: Text('Запрос средств', style: kRequestText),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RequestButton(
                          colour: Colors.white,
                          data: const Text(
                            'Перевод',
                            style: TextStyle(
                                color: orangeColor,
                                fontFamily: 'Gilroy-Regular',
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Transfer()));
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        RequestButton(
                          colour: orangeColor,
                          data: const Text('Запрос',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Gilroy-Regular',
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500)),
                          onPress: () {
                            setState(() {
                              typeRequest = SendType.sendRequest;
                              textTypeRequest = SendType.textRequest;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 18),
                          child: Text(
                            'На карту',
                            style: ktoCardStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CarouselSlider.builder(
                          itemCount: 2,
                          options: CarouselOptions(
                            height: 50,
                            viewportFraction: 0.9,
                            enableInfiniteScroll: false,
                          ),
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Container(
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDADADA)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height: 36,
                                      width: 68,
                                      decoration: BoxDecoration(
                                          color: orangeColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            child: Text(
                                              cardList[index].cardName,
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                    fontSize: 5,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            top: 5,
                                            bottom: 27,
                                            left: 5,
                                            right: 20,
                                          ),
                                          Positioned(
                                            child: Text(
                                              cardList[index].cardNumber,
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                    fontSize: 4,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            top: 27,
                                            bottom: 4,
                                            left: 3,
                                            right: 25,
                                          ),
                                          Positioned(
                                            child: Image(
                                                image: AssetImage(
                                                    cardList[index].cardType)),
                                            top: 6,
                                            bottom: 23,
                                            left: 58,
                                            right: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          cardList[index].cardName,
                                          style: GoogleFonts.montserrat(
                                              textStyle: kCardChooseStyle),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cardList[index].cardNumber,
                                          style: GoogleFonts.montserrat(
                                              textStyle: kCardChooseStyle),
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          }),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Введите номер карты',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF898A8D)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 250,
                          height: 50,
                          child: TextFormField(
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CardNumberInputFormatter(),
                              LengthLimitingTextInputFormatter(22),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      height: 70,
                      child: const TextField(
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Добавьте ваш комментарий',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 23),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: orangeColor,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SuccessRequest();
                            }));
                          },
                          child: const Text(
                            'Отправить запрос',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
