import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';



class SecurityPage extends StatelessWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        leading: IconButton(icon: Icon(Icons.chevron_left), onPressed: () { Navigator.pop(context); }, color: Color(0xFF2C313B), iconSize: 30,),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("Настройки безопастности", style: kSecurityPage,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0.25,
                        shadowColor: greyColor,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: Size(double.infinity, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Изменить пароль', style:  kSecurityButton),
                        Icon(Icons.chevron_right, color:Color(0xFF2C313B),),

                      ],

                    ),),
                SizedBox(height: 10),
                TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0.25,
                        shadowColor: greyColor,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        fixedSize: Size(double.infinity, 50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Изменить PIN-код', style: kSecurityButton),
                        Icon(Icons.chevron_right, color:Color(0xFF2C313B),),

                      ],

                    ),),
              ],
            ),
            Divider(),
            Column(
              children: [
                TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0.25,
                        shadowColor: greyColor,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        fixedSize: Size(double.infinity, 50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Подтверждение оплаты', style:  kSecurityButton),
                        Icon(Icons.chevron_right, color:Color(0xFF2C313B),),

                      ],

                    ),),
                SizedBox(height: 10),
                TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0.25,
                        shadowColor: greyColor,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: Size(double.infinity, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Вход с помощью отпечатка', style:  kSecurityButton),
                        Icon(Icons.chevron_right, color:Color(0xFF2C313B),),

                      ],

                    ),),
              ],
            ),
            Divider(),
            TextButton(onPressed: (){},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0.25,
                    shadowColor: greyColor,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Добавить резервный номер', style:  kSecurityButton),
                    Icon(Icons.add, color: orangeColor,),

                  ],

                ),),



          ]

            ),
      ),
    );
  }
}
class SecurityPageButton extends StatefulWidget {
  const SecurityPageButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  State<SecurityPageButton> createState() => _SecurityPageButtonState();
}



class _SecurityPageButtonState extends State<SecurityPageButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0.25,
            shadowColor: greyColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),),),
        child: Row(
          children: [
            widget.icon,
            const SizedBox(
              width: 20
            ),
            Text(
              widget.label,
              style: kSettingsButton,
            ),
          ],
        ),);
  }
}
