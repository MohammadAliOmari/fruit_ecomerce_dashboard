import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/services/get_it_services.dart';
import 'package:fruit_dashboard/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_dashboard/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruit_dashboard/features/auth/presentation/view/widgets/auth_app_bar.dart';
import 'package:fruit_dashboard/features/auth/presentation/view/widgets/signin_view_body_bloc_builder.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: authbuildAppBar(context, title: 'تسجيل دخول'),
        body: const SigninViewBodyBlocBuilder(),
      ),
    );
  }
}
