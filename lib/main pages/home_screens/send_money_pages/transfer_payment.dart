import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:DartPay/models/card_model.dart';

import 'end_check.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: orangeColor,
              child: const Center(
                child: Text(
                  'Чек к оплате',
                  style: kCheckToPayText,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 59),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'С карты',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    CarouselSlider.builder(
                        itemCount: 2,
                        options: CarouselOptions(
                          viewportFraction: 0.9,
                          height: 50,
                          enableInfiniteScroll: false,
                        ),
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Container(
                            margin: EdgeInsets.only(right: 15),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      cardList[index].cardName,
                                      style: kCardNameMedium,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      cardList[index].cardNumber,
                                      style: kCardNameMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(height: 20.5),
                    const Text(
                      'Карта получателя:',
                      style: kRecipientStyle,
                    ),
                    const SizedBox(height: 10),
                    const Text('8600 **** **** 0000', style: kCardNumberLarge),
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
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Добавьте ваш комментарий',
                          hintStyle: kAddCommentStyle,
                          border: OutlineInputBorder(),
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
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/transferPayment');
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
          ),
        ],
      ),
    );
  }
}
