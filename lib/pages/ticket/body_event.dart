import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/pages/ticket/widgets/card_event.dart';
import 'package:flutter/material.dart';

class BodyEvent extends StatelessWidget {
  const BodyEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      padding: LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
      itemBuilder: (context, index) => CardEvent(),
    );
  }
}
