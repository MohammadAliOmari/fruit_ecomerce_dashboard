import 'package:flutter/material.dart';
import 'package:fruit_dashboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';

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
        body: const AddProductViewBody());
  }
}
