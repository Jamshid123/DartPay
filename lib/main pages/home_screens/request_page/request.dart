import 'package:DartPay/constants.dart';
import 'package:DartPay/main%20pages/home_screens/request_page/request_button.dart';
import 'package:DartPay/main%20pages/home_screens/send_money_pages/send_money.dart';
import 'package:DartPay/models/card_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:http/http.dart' as http;

import 'success_request.dart';

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
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: false,
    scanExpiryDate: false,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );
  Future<void> scanCard() async {
    var cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted) return;
    setState(() {
      _cardDetails = cardDetails!;
    });
  }

  final _controller = MaskedTextController(mask: '0000 0000 0000 0000');
  SendType? typeRequest;
  SendType? textTypeRequest;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/startPage');
                    },
                    child: Container(
                      height: screenHeight * 0.85,
                      width: screenWidth,
                      child: Image.asset(
                        'assets/images/cardPicture5.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  IconButton(
                    padding:
                        EdgeInsets.only(top: 20, right: screenWidth * 0.88),
                    icon: Icon(Icons.chevron_left, color: Colors.black),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/startPage');
                    },
                    iconSize: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text('Запрос средств', style: kCheckToPayText),
                  ),
                  Container(
                    height: screenHeight * 0.85,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.12,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        //Кнопки 'Перевод' и 'Запрос'
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RequestButton(
                              colour: Colors.white,
                              data: const Text(
                                'Перевод',
                                style: kTransferButtonStyle,
                              ),
                              onPress: () {
                                Navigator.popAndPushNamed(
                                    context, '/sendMoney');
                              },
                            ),
                            const SizedBox(width: 15),
                            RequestButton(
                              colour: orangeColor,
                              data: const Text('Запрос',
                                  style: kRequestButtonStyle),
                              onPress: () {
                                setState(
                                  () {
                                    typeRequest = SendType.sendRequest;
                                    textTypeRequest = SendType.textRequest;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        //Все остальное после них
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text(
                                'На карту',
                                style: ktoCardStyle,
                              ),
                            ),
                            SizedBox(height: 3),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: CarouselSlider.builder(
                                itemCount: cardList.length,
                                options: CarouselOptions(
                                  height: 50,
                                  viewportFraction: 0.9,
                                  enableInfiniteScroll: false,
                                ),
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFFDADADA),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          height: 36,
                                          width: 68,
                                          decoration: BoxDecoration(
                                            color: orangeColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                child: Text(
                                                  cardList[index].cardName,
                                                  style: const TextStyle(
                                                      fontFamily: 'Mont',
                                                      fontSize: 5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                top: 5,
                                                bottom: 27,
                                                left: 5,
                                                right: 20,
                                              ),
                                              Positioned(
                                                child: Text(
                                                  cardList[index].cardNumber,
                                                  style: const TextStyle(
                                                      fontFamily: 'Mont',
                                                      fontSize: 4,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                                top: 27,
                                                bottom: 4,
                                                left: 3,
                                                right: 25,
                                              ),
                                              Positioned(
                                                child: Image(
                                                  image: AssetImage(
                                                      cardList[index].cardType),
                                                ),
                                                top: 6,
                                                bottom: 23,
                                                left: 58,
                                                right: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              cardList[index].cardName,
                                              style: kCardChooseStyle,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(cardList[index].cardNumber,
                                                style: kCardChooseStyle),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'Введите номер карты',
                                style: kInputCardNumberStyle,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: 250,
                                  height: 50,
                                  child: TextField(
                                    cursorColor: greyColor,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: greyColor),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: _controller,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        scanCard();
                                      },
                                      icon: Image.asset(
                                        'assets/images/barcode_scanner.png',
                                        color: orangeColor,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.person_add_alt_1_outlined,
                                        color: orangeColor,
                                        size: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              height: 140,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(height: 37),
                            Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              height: 70,
                              child: const TextField(
                                cursorColor: greyColor,
                                keyboardType: TextInputType.text,
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: 'Добавьте ваш комментарий',
                                  hintStyle: kAddCommentStyle,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: greyColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 23),
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: orangeColor,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/successRequest');
                                },
                                child: const Text(
                                  'Отправить запрос',
                                  style: kManualStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
