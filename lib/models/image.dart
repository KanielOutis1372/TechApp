class Image {
  int id;
  int productId;
  String imageUrl;

  Image({required this.id, required this.productId, required this.imageUrl});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      productId: json['product_id'] is String
          ? int.parse(json['product_id'])
          : json['product_id'],
      imageUrl: json['imageURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'imageURL': imageUrl,
    };
  }
}
