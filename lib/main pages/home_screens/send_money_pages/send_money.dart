import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:untitled/main%20pages/home_screens/request_page/request.dart';
import 'package:untitled/models/card_model.dart';
import '../../../constants.dart';
import '../request_page/request_button.dart';
import 'check_payment.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  var _controller = MaskedTextController(mask: '0000 0000 0000 0000');
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
      Expanded(
        child: Container(
          color: Colors.deepOrange,
          child: Center(
            child: const Text('Перевод',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RequestButton(
                      colour: orangeColor,
                      data: const Text(
                        'Перевод',
                        style: TextStyle(color: Colors.white,fontFamily: 'Gilroy-Regular',
                            fontSize: 14,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    RequestButton(
                      colour: Colors.white,
                      data: const Text('Запрос',
                          style:TextStyle(color: orangeColor,fontFamily: 'Gilroy-Regular',
                              fontSize: 14,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500)),
                      onPress: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){return RequestPage();}));
                      },
                    )
                  ],
                ),
             SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'С карты',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding:
                      EdgeInsets.only(left: 16, right: screenWidth * 0.27),
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
                                  style:  TextStyle(
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
                                  style:  TextStyle(
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
                                child: Image.asset('assets/images/logo_uzcard_512.png'),
                                top: 19,
                                right: 21,
                                left: 237,
                                bottom: 27,
                              )
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'На карту',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // IconButton(
                //     padding: EdgeInsets.only(),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return Scan();
                //       }));
                //     },
                //     icon: const Icon(Icons.qr_code_scanner_rounded)),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: screenWidth * 0.26),
                  child: TextField(
                  controller: _controller,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 330,
                    height: 160,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'По курсу 1 ₽ = 145,78 сум',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: ElevatedButton(
                    onPressed: ()  {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TransferPayment() ));
                    },
                    child: Text('Продолжить'),
                    style: ElevatedButton.styleFrom(
                        primary: orangeColor,
                        fixedSize: Size(screenWidth * 0.91, 50)),
                  ),
                )
              ],
            ),
          ))
    ]));
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

    var buffer = new StringBuffer();
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
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
