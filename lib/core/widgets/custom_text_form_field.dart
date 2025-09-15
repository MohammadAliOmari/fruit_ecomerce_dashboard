import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.suffixIcon,
      this.onSaved,
      this.obscureText = false,
      this.toogglePassword,
      this.maxLines = 1,
      this.controller});
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool? obscureText; // Default value, can be changed if needed
  final void Function()? toogglePassword;
  final int? maxLines;
  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      obscureText: obscureText!,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: obscureText != null
            ? (suffixIcon != null
                ? IconButton(
                    onPressed: toogglePassword,
                    icon: suffixIcon!,
                  )
                : null)
            : null,
        filled: true,
        fillColor: AppColors.lightgrey.withOpacity(.2),
        hintStyle: const AppTextStyles().bodysmallbold.copyWith(
              color: AppColors.lightgrey2,
            ),
        hintText: hintText,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: BorderSide(color: Colors.blue),
        // ),
      ),
      // style: TextStyle(fontSize: 16.0, color: Colors.black),
      // cursorColor: Colors.blue,
      // keyboardType: TextInputType.text,
      // textInputAction: TextInputAction.done,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: AppColors.lightgrey,
        width: 1,
      ),
    );
  }
}
