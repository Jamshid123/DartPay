import 'package:flutter/material.dart';
import 'dart:async';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:credit_card_scanner/models/card_scan_options.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'models/option_configure_widget.dart';


class CardScan extends StatefulWidget {
  @override
  _CardScanState createState() => _CardScanState();
}

class _CardScanState extends State<CardScan> {
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('card_scanner app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildScreenLock(context)
            ],
          ),
        ),
      ),
    );
  }
}


buildScreenLock(BuildContext context) {
  screenLock(
    context: context,
    title: Text('change title'),
    confirmTitle: Text('change confirm title'),
    correctString: '1234',
    confirmation: true,
    screenLockConfig: ScreenLockConfig(
      backgroundColor: Colors.transparent,
    ),
    secretsConfig: SecretsConfig(
      spacing: 15, // or spacingRatio
      padding: const EdgeInsets.all(40),
      secretConfig: SecretConfig(
        borderColor: Colors.amber,
        borderSize: 2.0,
        disabledColor: Colors.black,
        enabledColor: Colors.amber,
        height: 15,
        width: 15,
        build: (context, {required config, required enabled}) {
          return SizedBox(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: enabled ? config.enabledColor : config.disabledColor,
                border: Border.all(
                  width: config.borderSize,
                  color: config.borderColor,
                ),
              ),
              padding: EdgeInsets.all(10),
              width: config.width,
              height: config.height,
            ),
            width: config.width,
            height: config.height,
          );
        },
      ),
    ),
    inputButtonConfig: InputButtonConfig(
      textStyle: InputButtonConfig.getDefaultTextStyle(context).copyWith(
        color: Colors.orange,
        fontWeight: FontWeight.bold,
      ),
      buttonStyle: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        backgroundColor: Colors.deepOrange,
      ),
    ),
    cancelButton: const Icon(Icons.close),
    deleteButton: const Icon(Icons.delete),
  );
}