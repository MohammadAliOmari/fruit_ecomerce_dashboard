import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/helper/functions/build_error_snack_bar.dart';
import 'package:fruit_dashboard/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruit_dashboard/features/dashboard/presentation/view/dashboard_view.dart';

class SigninBlocListener extends StatelessWidget {
  const SigninBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listenWhen: (previous, current) =>
          current is SigninLoading ||
          current is SigninSuccess ||
          current is PasswordVisibilityState ||
          current is SigninFailure,
      listener: (context, state) {
        if (state is SigninLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SigninSuccess) {
          Navigator.pop(context); // Close the loading dialog
          Navigator.pushReplacementNamed(context, DashboardView.routeName);
        } else if (state is SigninFailure) {
          Navigator.pop(context); // Close the loading dialog
          builderrorsnackbar(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
