import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/pages/ticket/widgets/card_history_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BodyHistoryEvent extends StatelessWidget {
  const BodyHistoryEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
      itemBuilder: (context, index) => const CardHistoryEvent(),
    );
  }
}
