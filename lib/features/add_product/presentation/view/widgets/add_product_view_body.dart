import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_dashboard/features/add_product/presentation/view/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
              const CustomTextFormField(
                  hintText: 'Product Name ', keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                  hintText: 'Product Price', keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                  hintText: 'product Code ', keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                  maxLines: 5,
                  hintText: ' Product Description',
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onImageSelected: (imageFile) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
