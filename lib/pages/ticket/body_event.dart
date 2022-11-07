import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/pages/ticket/detail_event_page.dart';
import 'package:digital_sport/pages/ticket/widgets/card_event.dart';
import 'package:digital_sport/providers/get/data_events_providers.dart';
import 'package:digital_sport/providers/get/data_myticket_provider.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyEvent extends StatefulWidget {
  const BodyEvent({Key? key}) : super(key: key);

  @override
  State<BodyEvent> createState() => _BodyEventState();
}

class _BodyEventState extends State<BodyEvent> {
  @override
  void initState() {
    super.initState();
    context.read<EventsProvider>().getdataEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsProvider>(builder: (context, dataEvent, _) {
      if (dataEvent.isLoadEvent == true) {
        return const WidgetLoadingIndicator(size: 30);
      } else {
        return ListView.builder(
          itemCount: dataEvent.dataEvent.length,
          padding:
              LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
          itemBuilder: (context, index) => CardEvent(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailEventPage(id: dataEvent.dataEvent[index].id)));
            },
            thumbnail: dataEvent.dataEvent[index].thumbnail,
            title: dataEvent.dataEvent[index].title,
            countTicket: dataEvent.dataEvent[index].countTicket.toString(),
            date: dataEvent.dataEvent[index].date,
            location: dataEvent.dataEvent[index].location,
          ),
        );
      }
    });
  }
}
