import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/home/tabs/list/task_wedgit.dart';
import 'package:todo_app/ui/utils/app_colors.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.primary,
          padding: const EdgeInsets.only(bottom: 15),
          child: CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: AppColors.white,
            dayColor: AppColors.white,
            activeDayColor: AppColors.primary,
            activeBackgroundDayColor: AppColors.white,
            dotsColor: AppColors.transparent,
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) => const TaskWedgit())),
        ),
      ],
    );
  }
}
