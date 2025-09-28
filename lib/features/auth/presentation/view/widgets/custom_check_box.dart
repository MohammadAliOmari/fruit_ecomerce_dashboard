import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.onchecked,
  });
  final ValueChanged<bool>? onchecked;
  // This widget is used to create a custom checkbox that can be toggled on and off.
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onchecked?.call(_isChecked);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: _isChecked ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
        ),
        child: _isChecked
            ? const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 16.0,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
