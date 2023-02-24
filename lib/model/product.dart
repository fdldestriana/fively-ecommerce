class Product {
  int? quantity;
  num? total;
  num? discountPercentage;
  num? discountedPrice;
  String? brand;
  String? category;
  String? description;
  num? rating;
  int id;
  String title;
  num price;
  String images;
  bool isFavorite = false;

  Product(
      {this.quantity,
      this.total,
      this.discountPercentage,
      this.discountedPrice,
      this.brand,
      this.category,
      this.description,
      this.rating,
      required this.id,
      required this.title,
      required this.price,
      required this.images});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      quantity: json['quantity'],
      total: json['total'],
      discountPercentage: json['discountPercentage'],
      discountedPrice: json['discountedPrice'],
      id: json['id'],
      title: json['title'],
      brand: json['brand'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      rating: json['rating'],
      images: (json['category'] == 'smartphones' ||
              json['category'] == 'laptops')
          ? 'https://api.lorem.space/image/watch?w=640&h=480&r=${json['id']}'
          : (json['category'] == 'groceries')
              ? 'https://api.lorem.space/image/shoes?w=640&h=480&r=${json['id']}'
              : 'https://api.lorem.space/image/fashion?w=640&h=480&r=${json['id']}');

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'total': total,
        'discountPercentage': discountPercentage,
        'discountedPrice': discountedPrice,
        'id': id,
        'title': title,
        'brand': brand,
        'price': price,
        'category': category,
        'description': description,
        'rating': rating,
        'images': images,
      };
}

var electronics = [
  "https://api.lorem.space/image/watch?w=640&h=480&r=10",
  "https://api.lorem.space/image/watch?w=640&h=480&r=6474",
  "https://api.lorem.space/image/watch?w=640&h=480&r=4816",
  "https://api.lorem.space/image/watch?w=640&h=480&r=937",
  "https://api.lorem.space/image/watch?w=640&h=480&r=9116",
  "https://api.lorem.space/image/watch?w=640&h=480&r=7880",
  "https://api.lorem.space/image/watch?w=640&h=480&r=4783",
  "https://api.lorem.space/image/watch?w=640&h=480&r=5302",
  "https://api.lorem.space/image/watch?w=640&h=480&r=8279",
  "https://api.lorem.space/image/watch?w=640&h=480&r=7806",
  "https://api.lorem.space/image/watch?w=640&h=480&r=9915",
  "https://api.lorem.space/image/watch?w=640&h=480&r=3440",
  "https://api.lorem.space/image/watch?w=640&h=480&r=1364",
  "https://api.lorem.space/image/watch?w=640&h=480&r=7977",
  "https://api.lorem.space/image/watch?w=640&h=480&r=329",
  "https://api.lorem.space/image/watch?w=640&h=480&r=8627",
  "https://api.lorem.space/image/watch?w=640&h=480&r=4287",
  "https://api.lorem.space/image/watch?w=640&h=480&r=9783",
  "https://api.lorem.space/image/watch?w=640&h=480&r=1932",
  "https://api.lorem.space/image/watch?w=640&h=480&r=8410"
];

var womensClothing = [
  "https://api.lorem.space/image/fashion?w=640&h=480&r=6905",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=2115",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=4407",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=103",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=2671",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=125",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=2702",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=5008",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=2574",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=5952",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=9237",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=3872",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=973",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=5939",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=304",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=4950",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=4335",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=8935",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=4838",
  "https://api.lorem.space/image/fashion?w=640&h=480&r=8695"
];

var mensClothing = [
  "https://api.lorem.space/image/shoes?w=640&h=480&r=7931",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=6097",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=1973",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=5927",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=5310",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=9275",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=7519",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=857",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=4107",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=6638",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=9988",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=6130",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=8113",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=4689",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=8694",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=5663",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=445",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=2326",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=6025",
  "https://api.lorem.space/image/shoes?w=640&h=480&r=9680"
];
