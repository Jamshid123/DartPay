import 'package:DartPay/models/card_transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../models/card_model.dart';
import '../../../constants.dart';
import 'button.dart';
import 'request_page/request.dart';
import 'send_money_pages/send_money.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dateFormatter = DateFormat('yyyy-MM-dd');
  var _data = DateFormat('dd.MM.yyyy').format(DateTime.now());
  int _currentIndex = 0;
  CardTransactionModel transactionModel = CardTransactionModel();

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
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  viewportFraction: 0.8,
                  height: 150,
                  enableInfiniteScroll: false,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    width: 280,
                    // margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: orangeColor,
                    ),
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/svg/cardPicture2.svg'),
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
                children:[
                  Button(
                    onPress: () {
                      Navigator.pushNamed(context, '/sendMoney');
                    },
                    colour: Colors.transparent,
                    data: const Text(
                      'Перевести средства',
                      style: kButtonHomePageStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Button(
                    onPress: () {
                      Navigator.pushNamed(context, '/requestPage');
                    },
                    colour: Colors.transparent,
                    data: const Text(
                      'Запросить средства',
                      style: kButtonHomePageStyle,
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
                ],
              ),
              SizedBox(height: 12),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        SvgPicture.asset('assets/svg/elipse.svg'),
                                        Text('RM', style: TextStyle(
                                            fontFamily: 'Mont',
                                            color: greyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
