import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_dashboard/features/home/presentation/view/home_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  static const String routeName = '/dashboard';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  final List<String> _labels = [
    "Overview",
    "Notifications",
    "Settings",
    "Profile",
  ];
  final List<IconData> _icons = [
    Icons.bar_chart,
    Icons.notifications,
    Icons.settings,
    Icons.person,
  ];
  final List<Widget> _screens = [
    HomeView(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Overview'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40), // pill shape
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_labels.length, (index) {
              final bool isSelected = _currentIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  // padding: const EdgeInsets.symmetric(
                  //   horizontal: 14,
                  // ),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AppColors.lightgrey : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 6), // space before icon
                      if (isSelected) // 👈 label only shows when active
                        Text(
                          _labels[index],
                          style:
                              const AppTextStyles().bodyXsmallSemibold.copyWith(
                                    color: isSelected
                                        ? AppColors.primary
                                        : Colors.grey,
                                  ),
                        ),
                      const SizedBox(width: 6),
                      CircleAvatar(
                        backgroundColor:
                            isSelected ? AppColors.primary : Colors.transparent,
                        child: Icon(
                          _icons[index],
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
                      ),
                      // space between items
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
