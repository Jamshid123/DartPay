import 'package:DartPay/main%20pages/home_screens/request_page/request.dart';
import 'package:DartPay/models/card_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:credit_card_scanner/models/card_scan_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import '../../../constants.dart';
import '../request_page/request_button.dart';
import 'transfer_payment.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  var _controller = MaskedTextController(mask: '0000 0000 0000 0000');
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Row(
                children: [
                  IconButton(

                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left),
                    color: Color(0xFF2C313B),
                    iconSize: 30,
                  ),
                  const SizedBox(width: 120),
                  Center(child: Text('Перевод', style: kRequestText),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 12
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RequestButton(
                        colour: orangeColor,
                        data: const Text(
                          'Перевод',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gilroy-Regular',
                              fontSize: 14,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                        ),
                        onPress: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 15
                      ),
                      RequestButton(
                        colour: Colors.white,
                        data: const Text('Запрос',
                            style: TextStyle(
                                color: orangeColor,
                                fontFamily: 'Gilroy-Regular',
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500)),
                        onPress: () {
                         Navigator.pushNamed(context, '/requestPage');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'С карты',
                      style: kInputCardNumberStyle,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 80,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(
                            left: 16, right: screenWidth * 0.27),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 300,
                            decoration: BoxDecoration(
                                color: orangeColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Text(
                                    cardList[index].cardName,
                                    style: TextStyle(
                                        fontFamily: 'Mont',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  top: 12,
                                  right: 139,
                                  left: 35,
                                  bottom: 45,
                                ),
                                Positioned(
                                  child: Text(
                                    cardList[index].cardNumber,
                                    style: TextStyle(
                                        fontFamily: 'Mont',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                  top: 43,
                                  right: 111,
                                  left: 20,
                                  bottom: 12,
                                ),
                                Positioned(
                                  child: Image.asset(
                                      'assets/images/logo_uzcard_512.png'),
                                  top: 19,
                                  right: 21,
                                  left: 237,
                                  bottom: 27,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'На карту',
                      style: kInputCardNumberStyle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 250,
                        height: 50,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          controller: _controller,
                        ),
                      ),
                      SizedBox(width: 10),
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
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    margin:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 23),
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: orangeColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context,'/transferPayment');
                      },
                      child: const Text(
                        'Продолжить',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: 'Gilroy-Regular'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
