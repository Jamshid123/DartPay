import 'package:flutter/material.dart';
import 'package:untitled/main%20pages/home_screens/send_money_pages/success_transfer.dart';
import 'field_transfer.dart';

class EndCheck extends StatefulWidget {
  const EndCheck({Key? key}) : super(key: key);

  @override
  _EndCheckState createState() => _EndCheckState();
}

class _EndCheckState extends State<EndCheck> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Главная',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Перевод',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction[0].transactionNumber,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  transaction[0].transactionDate,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(transaction[0].transactionStatus,
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Text(transaction[0].sent,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Сумма',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Text(transaction[0].amount,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Получатель',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Text(transaction[0].person,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: ElevatedButton(
                onPressed: ()  {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessTransfer()));

                },
                child: Text('Перевести'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    fixedSize: Size(screenWidth * 0.91, 50)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
