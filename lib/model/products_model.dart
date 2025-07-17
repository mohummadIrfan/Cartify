class Products {
  int? id;
  String? title;
  String? description;
  double? price;
  String? image;
  Products({this.id, this.title, this.description, this.image, this.price});

  factory Products.fromjson(Map<String, dynamic> json) {
    return Products(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}
