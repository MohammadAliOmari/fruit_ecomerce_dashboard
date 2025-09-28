import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_dashboard/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruit_dashboard/features/auth/presentation/view/widgets/signin_bloc_listner.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<SigninCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autoValidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                controller: cubit.emailController,
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                toogglePassword: () => cubit.togglePasswordVisibility(),
                controller: cubit.passwordController,
                obscureText: cubit.obscureText,
                suffixIcon: cubit.obscureText
                    ? Icon(
                        Icons.visibility,
                        color: AppColors.lightgrey2.withOpacity(0.5),
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: AppColors.lightgrey2.withOpacity(0.5),
                      ),
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    'نسيت كلمة المرور؟',
                    style: const AppTextStyles().bodysmallSemibold.copyWith(
                          color: AppColors.lightprimary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomButton(
                  height: 54,
                  width: double.infinity,
                  title: 'تسجيل دخول',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.formKey.currentState!.save();
                      cubit.signInWithEmailAndPassword(
                        email: cubit.emailController.text,
                        password: cubit.passwordController.text,
                      );
                    } else {
                      setState(() {
                        cubit.autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
              const SizedBox(height: 33),
              const SigninBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
