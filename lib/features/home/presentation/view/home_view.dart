import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_dashboard/features/add_product/presentation/view/add_product_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
              width: 200,
              height: 40,
              title: 'Add Product',
              onPressed: () {
                Navigator.pushNamed(context, AddProductView.routeName);
              }),
        ],
      ),
    );
  }
}
