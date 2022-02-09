import 'package:flutter/material.dart';
import 'dart:async';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:credit_card_scanner/models/card_scan_options.dart';
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
              MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  scanCard();
                },
                child: Text('scan card'),
              ),
              Text('$_cardDetails'),
              Expanded(
                child: OptionConfigureWidget(
                  initialOptions: scanOptions,
                  onScanOptionChanged: (newOptions) => scanOptions = newOptions,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}