import 'package:flutter/material.dart';
import 'package:fruit_dashboard/features/add_product/presentation/view/add_product_view.dart';
import 'package:fruit_dashboard/features/dashboard/presentation/view/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // Define your routes here
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductView());

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
  }
}
