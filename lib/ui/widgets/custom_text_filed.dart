import 'package:flutter/material.dart';
import 'package:todo_app/ui/utils/app_colors.dart';
import 'package:todo_app/ui/utils/app_theme.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  CustomTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTheme.bottomSheetTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.unClickedIcon,
            fontSize: 16),
      ),
    );
  }
}
