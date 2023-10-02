import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/home/tabs/list/task_wedgit.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10, itemBuilder: ((context, index) => const TaskWedgit()));
  }
}
