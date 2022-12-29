class Product {
  int id;
  String title;
  num price;
  String category;
  String description;
  String images;
  bool isFavorite = false;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        category: json['category']['name'],
        description: json['description'],
        images: (json['images'] != [])
            ? json['images'][0]
            : 'https://api.lorem.space/image/watch?w=640&h=480&r=1040',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'category': category,
        'description': description,
        'images': images,
      };

  void addFavorite() {
    isFavorite = !isFavorite;
  }
}
