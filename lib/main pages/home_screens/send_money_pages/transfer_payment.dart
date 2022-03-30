import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:DartPay/models/card_model.dart';

import 'payment_check.dart';

class TransferPayment extends StatefulWidget {
  const TransferPayment({Key? key}) : super(key: key);

  @override
  _TransferPaymentState createState() => _TransferPaymentState();
}

class _TransferPaymentState extends State<TransferPayment> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: screenWidth,
                    child: Image.asset(
                      'assets/images/cardPicture6.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(top: 20),
                    icon: const Icon(Icons.chevron_left, color: Colors.black),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/sendMoney');
                    },
                    iconSize: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'Чек к оплате',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: screenHeight * 0.85,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: screenHeight * 0.12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'С карты',
                            style: kInputCardNumberStyle
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 60,
                            child: ListView.builder(
                                padding: EdgeInsets.only(right: 15),
                                scrollDirection: Axis.horizontal,
                                itemCount: cardList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: screenWidth - 40,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFFDADADA),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          height: 38,
                                          width: 68,
                                          decoration: BoxDecoration(
                                            color: orangeColor,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                child: Text(
                                                  cardList[index].cardName,
                                                  style: kCardNameCheckPage,
                                                ),
                                                top: 5,
                                                bottom: 27,
                                                left: 5,
                                                right: 20,
                                              ),
                                              Positioned(
                                                child: Text(
                                                  cardList[index].cardNumber,
                                                  style: kCardNumberCheckPage,
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
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              cardList[index].cardName,
                                              style: kCardChooseStyle,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              cardList[index].cardNumber,
                                              style: kCardChooseStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(height: 20.5),
                          const Text(
                            'Карта получателя:',
                            style: kRecipientStyle,
                          ),
                          const SizedBox(height: 10),
                          const Text('8600 **** **** 0000',
                              style: kCardNumberLarge),
                          const SizedBox(height: 10),
                          const Text(
                            'Сумма:',
                            style: kRecipientStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '3 000 000 сум (=20 583,05 рублей)',
                            style: kCardNumberLarge,
                          ),
                          SizedBox(height: 10),
                          const Text(
                            'Комиссия:',
                            style: kRecipientStyle,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '6 492 cум',
                            style: kCardNumberLarge,
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Container(
                              child: Column(
                                children: const [
                                  Text(
                                    'К оплате',
                                    style: kToPayStyle,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '3 006 492 cум',
                                    style: kAmountMoney,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Комментарий',
                            style: kCommentStyle,
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xFFDADADA))
                            ),
                            margin: const EdgeInsets.only(right: 15),
                            height: 70,
                            child: const TextField(
                              cursorColor: greyColor,
                              cursorHeight: 20,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Добавьте ваш комментарий',
                                contentPadding: EdgeInsets.all(15),
                                enabledBorder:InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintStyle: kAddCommentStyle,
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: orangeColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/successTransfer');
                              },
                              child: const Text(
                                'Перевести',
                                style: kManualStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
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
