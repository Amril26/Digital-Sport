import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardHistoryEvent extends StatelessWidget {
  final String title, location, countTicket, date, thumbnail;
  const CardHistoryEvent(
      {Key? key,
      required this.title,
      required this.location,
      required this.countTicket,
      required this.date,
      required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  thumbnail,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title.toUpperCase(),
                    maxLines: 1,
                    style: TextSetting.p2.copyWith(
                      color: ColorApp.txColorPrimary,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/location.png',
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          style: TextSetting.d1.copyWith(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Image.asset(
                      'assets/icons/tiket2.png',
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Tiket ($countTicket)',
                      maxLines: 1,
                      style: TextSetting.d1.copyWith(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat('dd MMMM yyyy, HH:mm')
                              .format(DateTime.parse(date))
                              .toString(),
                          maxLines: 1,
                          style: TextSetting.d1.copyWith(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        'Aktif'.toUpperCase(),
                        maxLines: 1,
                        style: TextSetting.d1.copyWith(
                          letterSpacing: 1,
                          color: ColorApp.colorPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
