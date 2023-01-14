class Cart {
  int id;
  int userId;
  String date;
  List<dynamic> products;

  Cart(
      {required this.id,
      required this.userId,
      required this.date,
      required this.products});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      products: json['products']);
}
