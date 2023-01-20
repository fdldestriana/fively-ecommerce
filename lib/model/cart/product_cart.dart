class ProductCart {
  int id;
  String title;
  num price;
  int quantity;
  num total;
  num discountPercentage;
  num discountedPrice;

  ProductCart(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.total,
      required this.discountPercentage,
      required this.discountedPrice});

  factory ProductCart.fromJson(Map<String, dynamic> json) {
    return ProductCart(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        quantity: json['quantity'],
        total: json['total'],
        discountPercentage: json['discountPercentage'],
        discountedPrice: json['discountedPrice']);
  }
}
