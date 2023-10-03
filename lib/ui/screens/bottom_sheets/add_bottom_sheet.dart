import 'package:flutter/material.dart';
import 'package:todo_app/ui/utils/app_colors.dart';
import 'package:todo_app/ui/utils/app_theme.dart';
import 'package:todo_app/ui/widgets/custom_text_filed.dart';

class AddBottomSheet extends StatefulWidget {
  AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  DateTime selectedDate = DateTime.now();

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
          CustomTextField(
              hintText: "Your Task Name", controller: titleController),
          const SizedBox(
            height: 8,
          ),
          CustomTextField(
              hintText: "Enter Task Details", controller: detailsController),
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
          InkWell(
            onTap: () {
              showMyDateClicker();
            },
            child: Text(
              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
              style: AppTheme.bottomSheetTextStyle.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.unClickedIcon),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              addToDoFireStore();
            },
            child: const Text("Add"),
          )
        ],
      ),
    );
  }

  void addToDoFireStore() {}

  void showMyDateClicker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
}
