import 'package:digital_sport/helpers/color_style.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WidgetLoadingIndicator extends StatelessWidget {
  final double size;
  const WidgetLoadingIndicator({Key? key, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: SizedBox(
        height: size,
        width: size,
        child: LoadingIndicator(
          indicatorType: Indicator.ballScale,
          colors: <Color>[ColorApp.colorPrimary],
        ),
      ),
    );
  }
}
