import 'dart:io';

import 'package:fruit_dashboard/features/add_product/domain/entities/review_product_entity.dart';

class AddProductEntity {
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
  final List<ReviewProductEntity> reviews;

  AddProductEntity({
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
}
