import 'package:DartPay/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color(0xFF2C313B),
          iconSize: 30,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Настройки безопастности",
            style: kSecurityPage,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0.25,
                    shadowColor: greyColor,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(double.infinity, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Изменить пароль', style: kSecurityButton),
                      const Icon(
                        Icons.chevron_right,
                        color: const Color(0xFF2C313B),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0.25,
                      shadowColor: greyColor,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(double.infinity, 50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){

                      }, child: const Text('Изменить PIN-код', style: kSecurityButton),),
                      const Icon(
                        Icons.chevron_right,
                        color: const Color(0xFF2C313B),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Column(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0.25,
                      shadowColor: greyColor,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(double.infinity, 50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Подтверждение оплаты', style: kSecurityButton),
                      const Icon(
                        Icons.chevron_right,
                        color: const Color(0xFF2C313B),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0.25,
                    shadowColor: greyColor,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(double.infinity, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Вход с помощью отпечатка', style: kSecurityButton),
                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF2C313B),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0.25,
                shadowColor: greyColor,
                padding: const EdgeInsets.only(left: 15, right: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: const Size(double.infinity, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Добавить резервный номер', style: kSecurityButton),
                  const Icon(
                    Icons.add,
                    color: orangeColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  buildScreenLock(BuildContext context) async {

    screenLock(
      context: context,
      title: const Text(
        "Установите PIN-код",
        style: kSetPinStyle,
      ),
      confirmTitle: const Text(
        "Подтвердите PIN-код",
        style: kSetPinStyle,
      ),
      correctString: '',
      confirmation: true,
      didConfirmed: (matchedText) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('pinCode', matchedText);
        Navigator.pushNamed(context, '/loginScreen');
      },
      screenLockConfig: ScreenLockConfig(
        backgroundColor: Colors.white,
      ),
      secretsConfig: SecretsConfig(
        spacing: 15, // or spacingRatio
        padding: const EdgeInsets.all(40),
        secretConfig: SecretConfig(
          enabledColor: orangeColor,
          disabledColor: greyColor,
          borderColor: Colors.transparent,
          borderSize: 2.0,
          height: 15,
          width: 15,
          build: (context, {required config, required enabled}) {
            return SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
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
          color: orangeColor,
          fontSize: 32,
          fontWeight: FontWeight.w400,
        ),
        buttonStyle: TextButton.styleFrom(
          side: BorderSide(color: orangeColor),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.white,
        ),
      ),
      cancelButton: const Icon(
        Icons.close,
        color: orangeColor,
      ),
      deleteButton: const Icon(
        Icons.backspace_outlined,
        color: orangeColor,
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
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          widget.icon,
          const SizedBox(width: 20),
          Text(
            widget.label,
            style: kSettingsButton,
          ),
        ],
      ),
    );
  }
}



