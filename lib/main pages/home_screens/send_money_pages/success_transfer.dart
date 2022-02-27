import 'package:flutter/material.dart';

class SuccessTransfer extends StatelessWidget {
  const SuccessTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 320),
            child: Container(
              child: Center(child: Image.asset('images/Vector.png'),),
            ),
          ),
          const Text(
            'Успешно!',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
        ],
      ),
    );
  }
}
