import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/helper/functions/on_genrate_route.dart';
import 'package:fruit_dashboard/features/dashboard/presentation/view/dashboard_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
