import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruit_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_dashboard/features/add_product/presentation/view/widgets/add_product_view_body_bloc_listener.dart';
import 'package:fruit_dashboard/features/add_product/presentation/view/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    AddProductCubit cubit = context.read<AddProductCubit>();
    return SingleChildScrollView(
      child: Form(
        key: cubit.formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextFormField(
                  controller: cubit.productNameController,
                  hintText: 'Product Name ',
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  controller: cubit.productPriceController,
                  hintText: 'Product Price',
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  controller: cubit.productCodeController,
                  hintText: 'product Code ',
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  controller: cubit.productDescriptionController,
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
                value: cubit.isFutureProduct,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  cubit.isFutureProduct = value!;
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              ImageField(
                selectedImage: cubit.image,
                onImageSelected: (imageFile) {
                  cubit.image = imageFile;
                  setState(() {});
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                  title: 'Add Product',
                  width: double.infinity,
                  height: 50,
                  onPressed: () {
                    if (cubit.image != null) {
                      // Proceed with form submission
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.formKey.currentState!.save();
                        AddProductEntity addProductEntity = AddProductEntity(
                          name: cubit.productNameController.text,
                          price: double.tryParse(
                                  cubit.productPriceController.text) ??
                              0.0,
                          code: cubit.productCodeController.text.toLowerCase(),
                          description: cubit.productDescriptionController.text,
                          isFutureProduct: cubit.isFutureProduct,
                          image: cubit.image!,
                        );

                        cubit.addProduct(addProductEntity);
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
              const AddProductBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
