import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_text_styles.dart';

AppBar authbuildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    // leading: IconButton(
    //   icon: const Icon(Icons.arrow_back_ios_new),
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    // ),
    title: Text(
      title,
      style: const AppTextStyles().bodyLargebold,
    ),
    centerTitle: true,
  );
}
