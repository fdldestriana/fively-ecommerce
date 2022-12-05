class Product {
  int id;
  String title;
  num price;
  String category;
  String description;
  String images;
  bool isFavorite = false;
  // Map<String, dynamic> rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.images,

    // required this.rating
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        category: json['category']['name'],
        description: json['description'],
        images: json['images'][0],
        // rating: json['rating']
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'category': category,
        'description': description,
        'images': images,
        // 'rating': rating
      };

  void addFavorite() {
    isFavorite = !isFavorite;
  }
}
