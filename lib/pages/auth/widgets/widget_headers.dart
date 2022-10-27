import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/cupertino.dart';

/// class ini digunakan untuk menampilkan headers pada login dan register
/// dimana yang ditampilkan adalah gambar dan text
///
/// [title1] adalah sebuah variabel yang digunakan pada bagian sisi kiri pada title
///
/// [title2] adalah sebuah variabel yang digunakan pada bagian sisi kanan pada title
///
/// [pathImage] adalah sebuah variabl dimana membarikan sebuah path dimana path tersebut digunakan untk menampilkan gambar **assets**
class WidgetHeadersLogin extends StatelessWidget {
  final String title1, title2;
  final String pathImage;
  const WidgetHeadersLogin({
    Key? key,
    required this.title1,
    required this.title2,
    required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '$title1 ',
                  style:
                      TextSetting.p1.copyWith(color: ColorApp.txColorPrimary)),
              TextSpan(
                text: title2,
                style: TextSetting.p1.copyWith(color: ColorApp.colorPrimary),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
        ),
        Image.asset(
          pathImage,
          height: 110,
        )
      ],
    );
  }
}
