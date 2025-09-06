import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruit_dashboard/features/add_product/presentation/view/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  bool isFutureProduct = false;
  File? image;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextFormField(
                  controller: productNameController,
                  hintText: 'Product Name ',
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  controller: productPriceController,
                  hintText: 'Product Price',
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  controller: productCodeController,
                  hintText: 'product Code ',
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  controller: productDescriptionController,
                  maxLines: 5,
                  hintText: ' Product Description',
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Is Future Product?',
                  style: const AppTextStyles().bodysmallSemibold,
                ),
                value: isFutureProduct,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  isFutureProduct = value!;
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              ImageField(
                onImageSelected: (imageFile) {
                  image = imageFile;
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                  title: 'Add Product',
                  width: double.infinity,
                  height: 50,
                  onPressed: () {
                    if (image != null) {
                      // Proceed with form submission
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        AddProductEntity addProductEntity = AddProductEntity(
                          name: productNameController.text,
                          price: double.tryParse(productPriceController.text) ??
                              0.0,
                          code: num.tryParse(
                                  productCodeController.text.toLowerCase()) ??
                              0,
                          description: productDescriptionController.text,
                          isFutureProduct: isFutureProduct,
                          image: image!,
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      // Show a snackbar or dialog indicating that the image is required
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select an image.'),
                        ),
                      );
                    }
                  }),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
