class Product {
  int id;
  String title;
  num price;
  String category;
  String description;
  String image;
  Map<String, dynamic> rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image,
      required this.rating});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rating: json['rating']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'category': category,
        'description': description,
        'image': image,
        'rating': rating
      };
}
