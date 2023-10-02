import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/ui/utils/app_colors.dart';
import 'package:todo_app/ui/utils/app_theme.dart';

class TaskWedgit extends StatelessWidget {
  const TaskWedgit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: AppColors.white),
      child: Slidable(
        startActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: AppColors.delete,
                foregroundColor: AppColors.white,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(24),
                label: 'Delete',
              ),
            ]),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.13,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
          child: Row(
            children: [
              const VerticalDivider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Play basket ball",
                      style: AppTheme.taskTitleTextStyle,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Colors.yellow,
                        ),
                        Text(
                          "10:30 AM",
                          style: AppTheme.taskDescriptionTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.check,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
