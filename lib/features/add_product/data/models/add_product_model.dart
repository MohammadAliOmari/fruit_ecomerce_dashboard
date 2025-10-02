import 'dart:io';

import 'package:fruit_dashboard/features/add_product/data/models/review_product_model.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
  final String name;
  final String description;
  final double price;
  final String code;
  final bool isFutureProduct;
  final File? image;
  String? imagePath;
  final int expireDate;
  final bool isOrganic;
  final int calories;
  final int unitAmount;
  final num avgRating;
  final int totalRating;
  final List<ReviewProductModel> reviews;

  AddProductModel({
    required this.code,
    required this.image,
    required this.isFutureProduct,
    required this.name,
    required this.description,
    required this.price,
    this.imagePath,
    required this.expireDate,
    required this.isOrganic,
    required this.calories,
    required this.unitAmount,
    required this.avgRating,
    required this.totalRating,
    required this.reviews,
  });

  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      code: entity.code,
      image: entity.image,
      isFutureProduct: entity.isFutureProduct,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      imagePath: entity.imagePath,
      expireDate: entity.expireDate,
      isOrganic: entity.isOrganic,
      calories: entity.calories,
      unitAmount: entity.unitAmount,
      avgRating: entity.avgRating,
      totalRating: entity.totalRating,
      reviews:
          entity.reviews.map((e) => ReviewProductModel.fromEntity(e)).toList(),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFutureProduct': isFutureProduct,
      'imagePath': imagePath,
      'expireDate': expireDate,
      'isOrganic': isOrganic,
      'calories': calories,
      'unitAmount': unitAmount,
      'avgRating': avgRating,
      'totalRating': totalRating,
      'reviews': reviews.map((e) => e.toMap()).toList(),
    };
  }
}
