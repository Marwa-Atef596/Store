class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModel rating;
   final String category;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromjson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
       category: json['category'],
      rating: RatingModel.fromjson(json['rating'] //map
          ),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final num count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }
}
