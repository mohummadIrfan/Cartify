class BannerModel {
  String? id;
  String? image;
  int? v;

  BannerModel({this.id, this.image, this.v});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(id: json['_id'], image: json['image'], v: json['__v']);
  }

  Map<String, dynamic> toJson() => {'_id': id, 'image': image, '__v': v};
}
