class Category {
  String name;

  Category({
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
