import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardEvent extends StatelessWidget {
  final String thumbnail, title, date, location, countTicket;
  final Function() onTap;
  const CardEvent(
      {Key? key,
      required this.onTap,
      required this.thumbnail,
      required this.title,
      required this.date,
      required this.location,
      required this.countTicket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(thumbnail),
                  colorFilter: ColorFilter.mode(
                      ColorApp.colorPrimary.withOpacity(0.3), BlendMode.color)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/bg_ticket.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextSetting.h1.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.parse(date))}',
                  style: TextSetting.p2.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/stadion.png',
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        location,
                        style: TextSetting.p2.copyWith(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 4,
                ),
                Row(children: [
                  Image.asset(
                    'assets/icons/tiket2.png',
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Tiket ($countTicket)',
                    maxLines: 1,
                    style: TextSetting.p2.copyWith(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
