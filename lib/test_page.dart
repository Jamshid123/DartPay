// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:credit_card_scanner/credit_card_scanner.dart';
// import 'package:credit_card_scanner/models/card_scan_options.dart';
// import 'package:flutter_screen_lock/flutter_screen_lock.dart';
// import 'models/option_configure_widget.dart';
//
//
// class CardScan extends StatefulWidget {
//   @override
//   _CardScanState createState() => _CardScanState();
// }
//
// class _CardScanState extends State<CardScan> {
//
//   var _textController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is disposed
//     _textController.dispose();
//     super.dispose();
//   }
//   var amount;
//
//   @override
//   void initState() {
//     _textController.addListener((){
//       setState(() {
//         amount = int.parse(_textController.text);
//       });
//     });
//     super.initState();
//   }
//
//   var url = Uri.parse('https://cbu.uz/oz/arkhiv-kursov-valyut/json/');
// var showedCurrency;
//    fetch() async {
//
//     var response = await http.get(url);
//     var jsData = jsonDecode(response.body);
//     var rate = jsData[0]['Rate'];
//     var sumOfCurrency = double.parse(rate);
//     var convertedAmount = (sumOfCurrency * amount);
//     setState(() {
//       showedCurrency = convertedAmount;
//     });
//   }
//   var show;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('card_scanner app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TextField(
//                 keyboardType: TextInputType.number,
//                 controller: _textController,
//                 decoration: InputDecoration(
//                 border: OutlineInputBorder()
//               ),
//               ),
//               SizedBox(height: 30,),
//               Container(
//                 margin: EdgeInsets.only(left: 10, right: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: Colors.grey)
//                 ),
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(child: showedCurrency == null ? Text('') : Text("$showedCurrency", style: TextStyle(fontSize: 30),) ),
//               ),
//               SizedBox(height: 10,),
//               ElevatedButton(onPressed: (){
//                 fetch();
//                 }, child: Text('Click'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// buildScreenLock(BuildContext context) {
//   screenLock(
//     context: context,
//     title: Text('change title'),
//     confirmTitle: Text('change confirm title'),
//     correctString: '1234',
//     confirmation: true,
//     screenLockConfig: ScreenLockConfig(
//       backgroundColor: Colors.transparent,
//     ),
//     secretsConfig: SecretsConfig(
//       spacing: 15, // or spacingRatio
//       padding: const EdgeInsets.all(40),
//       secretConfig: SecretConfig(
//         borderColor: Colors.amber,
//         borderSize: 2.0,
//         disabledColor: Colors.black,
//         enabledColor: Colors.amber,
//         height: 15,
//         width: 15,
//         build: (context, {required config, required enabled}) {
//           return SizedBox(
//             child: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 color: enabled ? config.enabledColor : config.disabledColor,
//                 border: Border.all(
//                   width: config.borderSize,
//                   color: config.borderColor,
//                 ),
//               ),
//               padding: EdgeInsets.all(10),
//               width: config.width,
//               height: config.height,
//             ),
//             width: config.width,
//             height: config.height,
//           );
//         },
//       ),
//     ),
//     inputButtonConfig: InputButtonConfig(
//       textStyle: InputButtonConfig.getDefaultTextStyle(context).copyWith(
//         color: Colors.orange,
//         fontWeight: FontWeight.bold,
//       ),
//       buttonStyle: OutlinedButton.styleFrom(
//         shape: RoundedRectangleBorder(),
//         backgroundColor: Colors.deepOrange,
//       ),
//     ),
//     cancelButton: const Icon(Icons.close),
//     deleteButton: const Icon(Icons.delete),
//   );
// }
//
//
//
// import 'package:DartPay/models/card_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'constants.dart';
//
//
//
// class MyHomePage extends StatefulWidget {
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//       ),
//       body: Center(
//         child: Swiper(
//           loop: false,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               margin: EdgeInsets.only(right: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: orangeColor,
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     child: Text(cardList[index].cardName,
//                         style: kCardName),
//                     top: 23,
//                     bottom: 110,
//                     left: 21,
//                     right: 140,
//                   ),
//                   Positioned(
//                     child: Container(
//                       margin: const EdgeInsets.only(
//                           left: 21, right: 170, top: 78, bottom: 54),
//                       width: 90,
//                       height: 18,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.white),
//                     ),
//                   ),
//                   Positioned(
//                     child: Text(cardList[index].cardNumber,
//                         style: const TextStyle(
//                             fontFamily: 'Mont',
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white)),
//                     left: 20,
//                     top: 110,
//                     right: 111,
//                     bottom: 20,
//                   ),
//                   Positioned(
//                     child: Image.asset(cardList[index].cardType),
//                     top: 25,
//                     bottom: 95,
//                     left: 280,
//                     right: 22,
//                   ),
//                 ],
//               ),
//             );
//           },
//           itemCount: cardList.length,
//           viewportFraction: 0.8
//         ),
//       )
//     );
//   }
// }
//
//
//
//
//
//



