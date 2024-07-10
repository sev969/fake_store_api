class GoodsModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  double? rating;
  int? count;

  GoodsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.count});

  GoodsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = Rating.fromJson(json).rate;
    count = Rating.fromJson(json).count;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['price'] = price;
  //   data['description'] = description;
  //   data['category'] = category;
  //   data['image'] = image;
  //   if (rating != null) {
  //     data['rating'] = rating!.toJson();
  //   }
  //   return data;
  // }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rating']['rate'].toDouble();
    count = json['rating']['count'].toInt();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['rate'] = rate;
  //   data['count'] = count;
  //   return data;
  // }
}
