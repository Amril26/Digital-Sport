import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/pages/ticket/widgets/card_history_event.dart';
import 'package:digital_sport/providers/get/data_myticket_provider.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BodyHistoryEvent extends StatefulWidget {
  const BodyHistoryEvent({Key? key}) : super(key: key);

  @override
  State<BodyHistoryEvent> createState() => _BodyHistoryEventState();
}

class _BodyHistoryEventState extends State<BodyHistoryEvent> {
  @override
  void initState() {
    super.initState();
    context.read<DataMyTicketProviders>().getMyTicket(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataMyTicketProviders>(builder: (context, data, _) {
      if (data.isLoad == true) {
        return const WidgetLoadingIndicator(size: 30);
      } else {
        return ListView.builder(
          itemCount: data.myTicket.length,
          padding:
              LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
          itemBuilder: (context, index) => CardHistoryEvent(
            title: data.myTicket[index]['title'].toString(),
            location: data.myTicket[index]['location'].toString(),
            countTicket: data.myTicket[index]['count_ticket'].toString(),
            date: data.myTicket[index]['date'].toString(),
            thumbnail: data.myTicket[index]['thumbnail'].toString(),
          ),
        );
      }
    });
  }
}
