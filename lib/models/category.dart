class Category {
  int id;
  String name;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['id'], name: json['title'], image: json['image']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': name,
        'images': image,
      };
}
