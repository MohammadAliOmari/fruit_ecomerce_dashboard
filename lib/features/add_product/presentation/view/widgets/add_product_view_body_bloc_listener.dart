import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/helper/functions/build_error_snack_bar.dart';
import 'package:fruit_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';

class AddProductBlocListener extends StatelessWidget {
  const AddProductBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductCubit, AddProductState>(
      listenWhen: (previous, current) =>
          current is AddProductLoading ||
          current is AddProductSuccess ||
          current is AddProductFailure,
      listener: (context, state) {
        if (state is AddProductLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AddProductSuccess) {
          // Close the loading dialog if it's open
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          builderrorsnackbar(context, 'Product added successfully');
          // Reset all form fields and UI state via cubit
          context.read<AddProductCubit>().resetForm();
        } else if (state is AddProductFailure) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context); // Close the loading dialog
          }
          builderrorsnackbar(context, state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
