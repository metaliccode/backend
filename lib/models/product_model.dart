class Product {
  int? id;
  String? name;
  String? description;
  String? price;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
  });

// map json to Product model

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}
