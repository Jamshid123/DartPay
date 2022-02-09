import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled/models/card_model.dart';

import 'check_payment_end.dart';

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
        body: Column(children: <Widget>[
      Expanded(
        child: Container(
          color: Colors.deepOrange,
          child: const Center(
            child: Text('Чек к оплате',
                style: TextStyle(
                    color: Color(0xFF535461),
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
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
                  children: <Widget>[
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
                    SizedBox(
                      height: 15,
                    ),
                    CarouselSlider.builder(
                        itemCount: 2,
                        options: CarouselOptions(
                          viewportFraction: 0.9,
                          height: 80,
                          enableInfiniteScroll: false,
                        ),
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFDADADA)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  height: 50,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        child: Text(
                                          cardList[index].cardType,
                                          style:  TextStyle(
                                            fontFamily: 'Mont',
                                                fontSize: 6,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),

                                        ),
                                        top: 15,
                                        bottom: 27,
                                        left: 5,
                                        right: 20,
                                      ),
                                      Positioned(
                                        child: Text(
                                          cardList[index].cardNumber,
                                          style:  TextStyle(
                                            fontFamily: 'Mont',
                                                fontSize: 7,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),

                                        ),
                                        top: 35,
                                        bottom: 4,
                                        left: 5,
                                        right: 25,
                                      ),
                                      Positioned(
                                        child: Image(
                                            image: AssetImage(
                                                cardList[index].cardType)),
                                        top: 5,
                                        bottom: 23,
                                        left: 70,
                                        right: 5,
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      cardList[index].cardName,
                                      style:  TextStyle(
                                          fontFamily: 'Mont',

                                          color: Colors.black)),

                                    const SizedBox(
                                      height: 5,
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 35),
                                      child: Text(
                                        cardList[index].cardNumber,
                                        style:   TextStyle(
                                            fontFamily: 'Mont',

                                            color: Colors.black)),

                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20.5,
                    ),
                    Text(
                      'Карта получателя:',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '8600 **** **** 0000',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Сумма:',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3 000 000 сум (=20 583,05 рублей)',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Комиссия:',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '6 492 cум',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'К оплате',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '3 006 492 cум',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Комментарий',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Добавьте ваш комментарий',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EndCheck()));
                          },
                          child: Text('Перевести'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                              fixedSize: Size(screenWidth * 0.91, 50)),
                        ),
                      ),
                    )
                  ]),
            ),
          ))
    ]));
  }
}
