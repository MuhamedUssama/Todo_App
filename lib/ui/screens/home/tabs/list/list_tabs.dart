import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks_dm.dart';
import 'package:todo_app/ui/screens/home/tabs/list/task_wedgit.dart';
import 'package:todo_app/ui/utils/app_colors.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  List<TasksDm> tasks = [];

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      getTasksList();
    }

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
            itemCount: tasks.length,
            itemBuilder: ((context, index) => TaskWedgit(model: tasks[index])),
          ),
        ),
      ],
    );
  }

  getTasksList() async {
    CollectionReference tasksCollection =
        FirebaseFirestore.instance.collection(TasksDm.collectionName);

    QuerySnapshot tasksSnapshot = await tasksCollection.get();

    List<QueryDocumentSnapshot> docs = tasksSnapshot.docs;

    for (int i = 0; i < docs.length; i++) {
      var singleDoc = docs[i];
      Map json = singleDoc.data() as Map;

      TasksDm task = TasksDm.fromJson(json);

      tasks.add(task);
    }
    setState(() {});
  }
}
