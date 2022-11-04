class EventModel {
  EventModel({
    required this.date,
    required this.thumbnail,
    required this.price,
    required this.countTicket,
    required this.location,
    required this.id,
    required this.title,
  });

  final String date;
  final String thumbnail;
  final int price;
  final int countTicket;
  final String location;
  final String id;
  final String title;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        date: json["date"] ?? '0000-00-00 00:00:00',
        thumbnail: json["thumbnail"] ??
            'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2020/04/30/4218235224.jpg',
        price: json["price"] ?? 0,
        countTicket: json["count_ticket"] ?? 0,
        location: json["location"] ?? '',
        id: json["id"] ?? '',
        title: json["title"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "thumbnail": thumbnail,
        "price": price,
        "count_ticket": countTicket,
        "location": location,
        "id": id,
        "title": title,
      };
}
