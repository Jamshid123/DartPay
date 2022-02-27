import 'package:flutter/material.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(50));

  int pinIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSecurityText(),
              SizedBox(height: 20.0),
              buildPinRow(),
              SizedBox(height: 40),
              buildNumberPad(),
            ],
          ),
        ),
      ),
    );
  }

  buildNumberPad() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardNumber(
                  n: 1,
                  onPressed: () {
                    pinIndexSetup("1");
                  }),
              KeyboardNumber(
                  n: 2,
                  onPressed: () {
                    pinIndexSetup("2");
                  }),
              KeyboardNumber(
                  n: 3,
                  onPressed: () {
                    pinIndexSetup("3");
                  }),
            ],
          ),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardNumber(
                  n: 4,
                  onPressed: () {
                    pinIndexSetup("4");
                  }),
              KeyboardNumber(
                  n: 5,
                  onPressed: () {
                    pinIndexSetup("5");
                  }),
              KeyboardNumber(
                  n: 6,
                  onPressed: () {
                    pinIndexSetup("6");
                  }),
            ],
          ),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardNumber(
                  n: 7,
                  onPressed: () {
                    pinIndexSetup("7");
                  }),
              KeyboardNumber(
                  n: 8,
                  onPressed: () {
                    pinIndexSetup("8");
                  }),
              KeyboardNumber(
                  n: 9,
                  onPressed: () {
                    pinIndexSetup("9");
                  }),
            ],
          ),
          SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.directions_transit),
                KeyboardNumber(
                    n: 0,
                    onPressed: () {
                      pinIndexSetup("0");
                    }),
                IconButton(
                  icon: Icon(Icons.backspace_outlined, color: Colors.orange),
                  onPressed: () {
                    clearPin();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  clearPin() {
    if (pinIndex == 0)
      pinIndex = 0;
    else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0)
      pinIndex = 1;
    else if (pinIndex < 4) pinIndex++;
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 4) print(strPin);
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        SizedBox(width: 25),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        SizedBox(width: 25),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        SizedBox(width: 25),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        )
      ],
    );
  }

  buildSecurityText() {
    return Text(
      "Установите Pin Code",
      style: TextStyle(color: Colors.black, fontSize: 18),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController? textEditingController;
  PINNumber({this.textEditingController, this.outlineInputBorder});
  final OutlineInputBorder? outlineInputBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.deepOrange,
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21,
          color: Colors.black,
        ),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int? n;
  final Function()? onPressed;
  KeyboardNumber({this.onPressed, this.n});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepOrangeAccent.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 80.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              color: Colors.deepOrangeAccent),
        ),
      ),
    );
  }
}
