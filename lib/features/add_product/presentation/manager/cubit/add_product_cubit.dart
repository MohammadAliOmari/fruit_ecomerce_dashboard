import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productRepo})
      : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  TextEditingController unitAmountController = TextEditingController();
  // TextEditingController avgRatingController = TextEditingController();
  // TextEditingController totalRatingController = TextEditingController();
  bool isFutureProduct = false;
  bool isOrganic = false;
  File? image;

  Future<void> addProduct(AddProductEntity product) async {
    emit(AddProductLoading());
    final imageEither = await imagesRepo.uploadImage(product.image!);
    await imageEither.fold((failure) async {
      emit(AddProductFailure(failure.message));
    }, (imageUrl) async {
      product.imagePath = imageUrl;
      final productEither = await productRepo.addProduct(product);
      productEither.fold((failure) {
        emit(AddProductFailure(failure.message));
      }, (sucsess) {
        emit(AddProductSuccess());
      });
    });
  }

  void resetForm() {
    // Reset form validation state
    formKey.currentState?.reset();
    autovalidateMode = AutovalidateMode.disabled;
    // Clear controllers
    productNameController.clear();
    productPriceController.clear();
    productCodeController.clear();
    productDescriptionController.clear();
    expireDateController.clear();
    caloriesController.clear();
    unitAmountController.clear();
    // Reset flags and image
    isFutureProduct = false;
    isOrganic = false;
    image = null;
    // Emit a state to notify listeners/UI to rebuild
    emit(AddProductInitial());
  }
}
