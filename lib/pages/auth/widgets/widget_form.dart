import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';


/// class ini digunakan untuk form custom dimana meneripa inputan dari user
///  
/// [title] variabel ini digunakna memberikan title pada form pada bagianatas
/// 
/// [hintText] variabel ini digunakna text pada yang bersifat hint pada form
/// 
/// [controllerText] variabel ini memberikan sebuah controller pada textForm
class WidgetForm extends StatelessWidget {
  final String title, hintText;
  final TextEditingController controllerText;

  const WidgetForm(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controllerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextSetting.p1.copyWith(
            color: ColorApp.colorPrimary,
            letterSpacing: 2,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            hintText: hintText,
            hintStyle: TextSetting.p2.copyWith(
              fontWeight: FontWeight.w200,
              letterSpacing: 2,
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
        )
      ],
    );
  }
}
