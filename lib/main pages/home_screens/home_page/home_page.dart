import 'package:DartPay/main%20pages/home_screens/request_page/request.dart';
import 'package:DartPay/models/button_model/request_button.dart';
import 'package:DartPay/models/card_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:DartPay/models/card_model.dart';
import 'package:DartPay/models/button_model/homePage_button.dart';
import 'package:DartPay/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dateFormatter = DateFormat('yyyy-MM-dd');
  var _data = DateFormat('dd.MM.yyyy').format(DateTime.now());
  int _currentIndex = 0;
  CardTransactionModel transactionModel = CardTransactionModel();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profileChange');
                },
                child: Padding(
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
                      const SizedBox(width: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Bayahmedov S.R.', style: kUserNameTextStyle),
                            SizedBox(height: 5),
                            Text(' (+ 998 90 211 35 09)',
                                style: kUserNumberTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 150,
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 15),
                  itemCount: cardData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return VisibilityDetector(
                      key: Key(index.toString()),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction == 1) {
                          setState(() {
                            _currentIndex = index;
                          });
                        }
                      },
                      child: Container(
                        width: 280,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: orangeColor,
                        ),
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/svg/cardPicture2.svg'),
                            Positioned(
                              child: Text(cardList[index].cardName,
                                  style: kCardName),
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
                              left: 237.5,
                              right: 22,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: cardData.map(
                  (item) {
                    int index = cardData.indexOf(item);
                    return Container(
                      width: 5,
                      height: 5,
                      margin: EdgeInsets.only(right: 7),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomePageButton(
                        onPress: () {
                          Navigator.pushNamed(context, '/sendMoney');
                        },
                        colour: orangeColor,
                        data: const Text(
                          'Перевести средства',
                          style: kButtonSendMoneyHomePage,
                          textAlign: TextAlign.center,
                        ),
                      ),
                  SizedBox(width: 10),
                  HomePageButton(
                    onPress: () {
                      Navigator.pushNamed(context, '/requestPage');
                    },
                    colour: Colors.transparent,
                    data: const Text(
                      'Запросить средства',
                      style: kButtonRequestMoneyHomePage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Недавние операции',
                      style: kRecentTextStyle,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 35),
                    Container(
                      height: 28,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: orangeColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              _data,
                              style: kDateStyle,
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
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: orangeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        //TODO Добавить навигацию!
                      },
                      child: SvgPicture.asset('assets/svg/dot_3.svg'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 150,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, int index) {
                    return Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(transactionModel.userAvatar),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          transactionModel.userName,
                                          style: kTransactionNameStyle,
                                        ),
                                        Text(
                                          transactionModel.transactionStatus,
                                          style: kCardTransactionStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    transactionModel.transactionAmount,
                                    style: kTransactionAmount,
                                  ),
                                  Text(
                                    transactionModel.transactionTime,
                                    style: kCardTransactionStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/elipse.svg'),
                                        Text(
                                          'RM',
                                          style: TextStyle(
                                              fontFamily: 'Mont',
                                              color: greyColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Muhamedova R.S',
                                          style: kTransactionNameStyle,
                                        ),
                                        Text(
                                          'Получено',
                                          style: kCardTransactionStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '+ 2 500 000',
                                    style: kTransactionAmountReceived,
                                  ),
                                  Text(
                                    transactionModel.transactionTime,
                                    style: kCardTransactionStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(transactionModel.userAvatar),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          transactionModel.userName,
                                          style: kTransactionNameStyle,
                                        ),
                                        Text(
                                          transactionModel.transactionStatus,
                                          style: kCardTransactionStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    transactionModel.transactionAmount,
                                    style: kTransactionAmount,
                                  ),
                                  Text(
                                    transactionModel.transactionTime,
                                    style: kCardTransactionStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
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
