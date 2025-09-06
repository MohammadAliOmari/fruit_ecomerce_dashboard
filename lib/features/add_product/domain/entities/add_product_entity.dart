import 'dart:io';

class AddProductEntity {
  final String name;
  final String description;
  final double price;
  final num code;
  final bool isFutureProduct;
  final File? image;
  final String? imagePath;

  AddProductEntity({
    required this.code,
    required this.image,
    required this.isFutureProduct,
    required this.name,
    required this.description,
    required this.price,
    this.imagePath,
  });
}
