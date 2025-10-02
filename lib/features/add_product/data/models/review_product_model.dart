import 'package:fruit_dashboard/features/add_product/domain/entities/review_product_entity.dart';

class ReviewProductModel {
  final String name;
  final String date;
  final int rating;
  final String reviewDescription;
  final String image;

  ReviewProductModel({
    required this.name,
    required this.date,
    required this.rating,
    required this.reviewDescription,
    required this.image,
  });

  factory ReviewProductModel.fromEntity(ReviewProductEntity entity) {
    return ReviewProductModel(
      name: entity.name,
      date: entity.date,
      rating: entity.rating,
      reviewDescription: entity.reviewDescription,
      image: entity.image,
    );
  }
  factory ReviewProductModel.fromJson(Map<String, dynamic> json) {
    return ReviewProductModel(
      name: json['name'],
      date: json['date'],
      rating: json['rating'],
      reviewDescription: json['reviewDescription'],
      image: json['image'],
    );
  }

  toMap() {
    return {
      'name': name,
      'date': date,
      'rating': rating,
      'reviewDescription': reviewDescription,
      'image': image,
    };
  }
}
