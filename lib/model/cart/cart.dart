class Cart {
  int id;
  int userId;
  num total;
  List<dynamic> products;
  int totalProducts;
  int totalQuantity;

  Cart(
      {required this.id,
      required this.userId,
      required this.total,
      required this.products,
      required this.totalProducts,
      required this.totalQuantity});

  factory Cart.fromJson(List<dynamic> json) => Cart(
      id: json[0]['id'],
      userId: json[0]['userId'],
      total: json[0]['total'],
      products: json[0]['products'],
      totalProducts: json[0]['totalProducts'],
      totalQuantity: json[0]['totalQuantity']);
}
