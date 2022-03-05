import 'package:DartPay/models/card_transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../../../models/card_model.dart';
import '../../../constants.dart';
import 'button.dart';
import 'request_page/request.dart';
import 'send_money_pages/send_money.dart';

enum SendType {
  send,
  take,
  textSend,
  textTake,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dateFormatter = DateFormat('yyyy-MM-dd');
  var _data = DateFormat('dd.MM.yyyy').format(DateTime.now());
  int _currentIndex = 0;
  SendType? typeSelected;
  SendType? textTypeSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/userAvatar.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Bayahmedov S.R.', style: kCardUserTextStyle),
                          SizedBox(height: 5),
                          Text(' (+ 998 90 211 35 09)',
                              style: kCardNumTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              CarouselSlider.builder(
                itemCount: cardList.length,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  viewportFraction: 0.78,
                  height: 150,
                  enableInfiniteScroll: false,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    width: 280,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: orangeColor,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child:
                              Text(cardList[index].cardName, style: kCardName),
                          top: 23,
                          bottom: 110,
                          left: 21,
                          right: 140,
                        ),
                        Positioned(
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 21, right: 170, top: 78, bottom: 54),
                            width: 90,
                            height: 18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                          ),
                        ),
                        Positioned(
                          child: Text(cardList[index].cardNumber,
                              style: const TextStyle(
                                  fontFamily: 'Mont',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                          left: 20,
                          top: 110,
                          right: 111,
                          bottom: 20,
                        ),
                        Positioned(
                          child: Image.asset(cardList[index].cardType),
                          top: 25,
                          bottom: 95,
                          left: 238,
                          right: 22,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: cardData.map(
                  (item) {
                    int index = cardData.indexOf(item);
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? orangeColor
                            : const Color(0xFFE5E5E5),
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    onPress: () {
                      Navigator.pushNamed(context, '/sendMoney');
                      setState(() {
                        typeSelected = SendType.send;
                        textTypeSelected = SendType.textSend;
                      });
                    },
                    colour: Colors.transparent,
                    data: const Text(
                      'Перевести средства',
                      style: TextStyle(
                          color: buttonTextColorInactive,
                          fontFamily: 'Gilroy-Regular',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Button(
                    onPress: () {
                      setState(() {
                        typeSelected = SendType.take;
                        textTypeSelected = SendType.textTake;
                      });
                      Navigator.pushNamed(context, '/requestPage');
                    },
                    colour: Colors.transparent,
                    data: const Text(
                      'Запросить средства',
                      style: TextStyle(
                          color: buttonTextColorInactive,
                          fontFamily: 'Gilroy-Regular',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Недавние операции',
                      style: kRecentTextStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    height: 28,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: orangeColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            _data,
                            style: const TextStyle(
                                fontSize: 14, color: orangeColor),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2020, 1, 1),
                                maxTime: DateTime(2022, 1, 1),
                                onChanged: (date) {}, onConfirm: (date) {
                              setState(() {
                                _data = DateFormat("dd.MM.yyyy").format(date);
                              });
                            }, locale: LocaleType.ru);
                          },
                          child: const Icon(Icons.arrow_drop_down, color: orangeColor,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cardTransactionList.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          cardTransactionList[index]
                                              .userAvatar),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              cardTransactionList[index]
                                                  .userName,
                                              style: kTransactionNameStyle),
                                          Text(
                                              cardTransactionList[index]
                                                  .transactionStatus,
                                              style: kCardTransactionStyle)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        cardTransactionList[index]
                                            .transactionAmount,
                                        style: kTransactionAmount),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Text(
                                          cardTransactionList[index]
                                              .transactionTime,
                                          style: kCardTransactionStyle),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          cardTransactionList[index]
                                              .userAvatar),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              cardTransactionList[index]
                                                  .userName,
                                              style: kTransactionNameStyle),
                                          Text(
                                              cardTransactionList[index]
                                                  .transactionStatus,
                                              style: kCardTransactionStyle)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        cardTransactionList[index]
                                            .transactionAmount,
                                        style:   kTransactionAmount  ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Text(
                                          cardTransactionList[index]
                                              .transactionTime,
                                          style: kCardTransactionStyle),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          cardTransactionList[index]
                                              .userAvatar),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              cardTransactionList[index]
                                                  .userName,
                                              style: kTransactionNameStyle),
                                          Text(
                                              cardTransactionList[index]
                                                  .transactionStatus,
                                              style: kCardTransactionStyle)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        cardTransactionList[index]
                                            .transactionAmount,
                                        style: kTransactionAmount),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Text(
                                          cardTransactionList[index]
                                              .transactionTime,
                                          style: kCardTransactionStyle),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
