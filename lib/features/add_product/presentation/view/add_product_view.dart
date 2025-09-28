import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashboard/core/services/get_it_services.dart';
import 'package:fruit_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_dashboard/features/add_product/presentation/view/widgets/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = '/addProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0,
          title: const Text('Add Product'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => AddProductCubit(
            imagesRepo: getIt.get<ImagesRepo>(),
            productRepo: getIt.get<ProductRepo>(),
          ),
          child: const AddProductViewBodyBlocBuilder(),
        ));
  }
}
