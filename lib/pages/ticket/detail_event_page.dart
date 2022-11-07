import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/providers/get/data_events_providers.dart';
import 'package:digital_sport/providers/get/data_user_provider.dart';
import 'package:digital_sport/providers/post/buy_product_provider.dart';
import 'package:digital_sport/providers/post/buy_ticket_provider.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailEventPage extends StatefulWidget {
  final String id;
  static String rootNamed = 'detail-event/';
  const DetailEventPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  @override
  void initState() {
    super.initState();
    context.read<EventsProvider>().detailEvent(id: widget.id);
    context.read<DataUserProvider>().userData(context);
  }

  Widget _headers(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.33,
            child: Consumer<EventsProvider>(builder: (context, dataDetail, _) {
              if (dataDetail.isLoadDetail == true) {
                return const WidgetLoadingIndicator(size: 30);
              } else {
                return Image.network(
                  context.read<EventsProvider>().dataDetail.thumbnail,
                  height: MediaQuery.of(context).size.height * 0.33,
                  fit: BoxFit.cover,
                );
              }
            })),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: ColorApp.colorPrimary,
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _bottomNavigationBar() {
    return Consumer3<BuyTicketProvider, EventsProvider, DataUserProvider>(
        builder: (context, buyTicket, dataDetail, dataUSer, _) {
      return InkWell(
        onTap: () => context.read<BuyTicketProvider>().buyTicket(context,
            thumbnail: dataDetail.dataDetail.thumbnail,
            title: dataDetail.dataDetail.title,
            location: dataDetail.dataDetail.location,
            date: dataDetail.dataDetail.date,
            totalPrice: buyTicket.countTicket == 1
                ? dataDetail.dataDetail.price
                : buyTicket.totalPrice,
            statusUser: dataUSer.dataProfile.status),
        child: Container(
          height: 60,
          alignment: Alignment.center,
          padding: LayoutMargin.marginVertical20,
          color: ColorApp.colorPrimary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/tiket2.png',
                color: Colors.white,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'beli TIket'.toUpperCase(),
                style: TextSetting.h2.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _counterAddEvent() {
    return Consumer2<BuyTicketProvider, EventsProvider>(
        builder: (context, buyEvent, dataEvent, child) {
      return Container(
        padding: LayoutMargin.marginHorizontal20.copyWith(
          top: 20,
          bottom: 20,
        ),
        color: ColorApp.colorPrimary.withOpacity(0.1),
        child: Row(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'SubTotal   ',
                  style: TextSetting.h2.copyWith(fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text:
                      'Rp ${buyEvent.countTicket == 1 ? NumberFormat("#,###", "ID_id").format(dataEvent.dataDetail.price) : NumberFormat("#,###", "ID_id").format(buyEvent.totalPrice)}',
                  style: TextSetting.h2.copyWith(
                      color: ColorApp.colorPrimary,
                      fontWeight: FontWeight.w500),
                ),
              ]),
            ),
            const Spacer(),
            InkWell(
              onTap: () => context
                  .read<BuyTicketProvider>()
                  .removeTicket(price: dataEvent.dataDetail.price),
              child: Image.asset(
                'assets/icons/remove_item.png',
                height: 24,
                width: 24,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '${buyEvent.countTicket}',
              style: TextSetting.h2.copyWith(
                  color: ColorApp.colorPrimary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 16,
            ),
            InkWell(
              onTap: () => context
                  .read<BuyTicketProvider>()
                  .addTicket(context, price: dataEvent.dataDetail.price),
              child: Image.asset(
                'assets/icons/add_item.png',
                height: 24,
                width: 24,
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _descriptionEvent() {
    return Consumer<EventsProvider>(builder: (context, dataDetail, _) {
      return Padding(
        padding: LayoutMargin.marginHorizontal20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              dataDetail.dataDetail.title.toUpperCase(),
              style: TextSetting.h1.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.parse(dataDetail.dataDetail.date))}',
              style: TextSetting.p2.copyWith(
                letterSpacing: 1,
                color: ColorApp.txColorsecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/stadion.png',
                  height: 30,
                  width: 30,
                  color: ColorApp.txColorPrimary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  dataDetail.dataDetail.location,
                  maxLines: 1,
                  style: TextSetting.p2.copyWith(
                    letterSpacing: 1,
                    color: ColorApp.txColorPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(children: [
              Image.asset(
                'assets/icons/tiket2.png',
                height: 30,
                width: 30,
                color: ColorApp.txColorPrimary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Tiket (${dataDetail.dataDetail.countTicket})',
                maxLines: 1,
                style: TextSetting.p2.copyWith(
                  letterSpacing: 1,
                  color: ColorApp.txColorPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ],
        ),
      );
    });
  }

  Widget _priceEvent() {
    return Consumer<EventsProvider>(builder: (context, dataEvent, _) {
      return Container(
        padding: LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
        margin: LayoutMargin.marginHorizontal20.copyWith(top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ColorApp.colorPrimary.withOpacity(0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Harga Tiket',
              style: TextSetting.p1
                  .copyWith(letterSpacing: 1, color: ColorApp.txColorPrimary),
            ),
            Text(
              dataEvent.isLoadDetail == true
                  ? 'Loading....'
                  : 'Rp ${NumberFormat("#,###", "ID_id").format(dataEvent.dataDetail.price)}',
              style: TextSetting.p1.copyWith(
                letterSpacing: 1,
                color: ColorApp.colorPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _headers(context),
          _descriptionEvent(),
          _priceEvent(),
          const Spacer(),
          _counterAddEvent(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
