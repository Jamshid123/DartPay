import 'package:DartPay/auth_pages/otp_sms.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';



class RegisterPhone extends StatefulWidget {
  const RegisterPhone({Key? key}) : super(key: key);

  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  final TextEditingController _controller = TextEditingController();
  String initialCountry = 'UZ';

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Image.asset('assets/images/uzb.jpg'), value: 'UZ',),
      DropdownMenuItem(child: Image.asset('assets/images/russia.jpg'),value: 'RU',),
    ];
    return menuItems;
  }
  String selectedValue = 'UZ';
  var currentIndex = 0;
  final index1 = codes[0];


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
            Text('Введите ваш номер телефона', style: kAddYourNumber,),
              // Row(
              //   children: [
              //     DropdownButton(items: dropdownItems, onChanged: (String? newValue) {
              //        setState(() {
              //         selectedValue = newValue!;
              //                });
              //         },
              //         value: selectedValue,
              //     ),
              //     TextField(
              //
              //       keyboardType: TextInputType.phone,
              //       decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderSide: BorderSide(
              //             color: Colors.grey
              //           )
              //         ),
              //           fillColor: Colors.white,
              //           prefixText: '+998'
              //       ),
              //     )
              //   ],
              // ),


              Padding(
                padding: EdgeInsets.only(left: 40,right: 40),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_drop_down_sharp),
                      CountryCodePicker(
                        dialogSize: Size(230,200),
                        hideMainText: true,
                        showFlag: true,
                        initialSelection: 'UZ',
                        countryList: codes,
                        hideSearch: true,
                      ),
                      Container(
                        width: 220,
                        height: 50,
                        child: TextFormField(
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Gilroy-Regular', color: greyColor),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              prefixText: currentIndex == index1  ?  '+998 ' :  '+7',
                              focusColor: Colors.transparent,
                              contentPadding: EdgeInsets.all(12.0),

                              fillColor: Colors.white
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),


              // CountryCodePicker(
              //   initialSelection: 'UZ',
              //   countryList: codes,
              //   showCountryOnly: true,
              //   showOnlyCountryWhenClosed: false,
              //   hideSearch: true,
              // ),
              // TextField(
              //   keyboardType: TextInputType.phone,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //   ),
              // ),



              // TextField(
              //   keyboardType: TextInputType.phone,
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //   ),
              // ),


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