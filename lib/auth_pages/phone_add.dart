import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class RegisterPhone extends StatefulWidget {
  const RegisterPhone({Key? key}) : super(key: key);
  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  final TextEditingController _controller = TextEditingController();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: SvgPicture.asset('assets/svg/globe.svg'),
        value: 'UZ',
      ),
      DropdownMenuItem(
        child: SvgPicture.asset('assets/svg/bell.svg'),
        value: 'RU',
      ),
    ];
    return menuItems;
  }

  String selectedValue = 'UZ';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const Text(
              'Введите ваш номер телефона',
              style: kAddYourNumber,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 40, right: 40),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: dropdownItems,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        value: selectedValue,
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 200,
                    height: 40,
                    child: TextFormField(
                      style: kInputPhoneNumberStyle,
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 0, minHeight: 0),
                        prefixIcon: selectedValue == 'UZ'
                            ? const Text(
                                '+998 ',
                                style: kInputPhoneNumberStyle,
                              )
                            : const Text(
                                '+7',
                                style: kInputPhoneNumberStyle,
                              ),
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/otpSms');}, child: Text('Продолжить'))
          ],
        ),
      ),
    );
  }

  // void getPhoneNumber(String phoneNumber) async {
  //   PhoneNumber number =
  //   await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');
  //
  //   setState(() {
  //     this.number = number;
  //   });
  // }
}

// Row(
//
// children:  [
// DropdownButton(items: dropdownItems, onChanged: (String? newValue){
// setState(() {
// selectedValue = newValue!;
// });
// },
// value: selectedValue,
// ),
// VerticalDivider(),
// // selectedValue == "UZ"? Text('+998')
// //     : Text('+7'),
//
// Container(
// width: 210,
// height: 40,
// child:  selectedValue == "UZ"? TextFormField(
// inputFormatters: [
// LengthLimitingTextInputFormatter(9)
// ],
// keyboardType: TextInputType.phone,
// decoration: InputDecoration(
//
// prefixText: '+998',
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(5)
// ),
//
// ),)
// : TextFormField(
// inputFormatters: [
// LengthLimitingTextInputFormatter(10)
// ],
// keyboardType: TextInputType.phone,
// decoration: InputDecoration(
// prefixText: '+7',
//
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(5)
// ),
//
// ),),
// ),
//
// // Padding(
// //   padding: const EdgeInsets.only(right: 40),
// //   child: TextFormField(
// //     keyboardType: TextInputType.number,
// //     decoration: InputDecoration(
// //         border: OutlineInputBorder()
// //     ),
// //     inputFormatters: <TextInputFormatter>[
// //       FilteringTextInputFormatter.digitsOnly
// //     ],
// //   ),
// // ),
//
//
// ],
// ),
