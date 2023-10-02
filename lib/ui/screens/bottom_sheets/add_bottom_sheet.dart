import 'package:flutter/material.dart';
import 'package:todo_app/ui/utils/app_colors.dart';
import 'package:todo_app/ui/utils/app_theme.dart';
import 'package:todo_app/ui/widgets/custom_text_filed.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.42,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Add New Task",
            textAlign: TextAlign.center,
            style: AppTheme.bottomSheetTextStyle,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(hintText: "Your Task Name"),
          const SizedBox(
            height: 8,
          ),
          CustomTextField(hintText: "Enter Task Details"),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Select Date",
            style: AppTheme.bottomSheetTextStyle
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "1/10/2023",
            style: AppTheme.bottomSheetTextStyle.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.unClickedIcon),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text("Add"))
        ],
      ),
    );
  }
}
