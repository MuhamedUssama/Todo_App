import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/bottom_sheets/add_bottom_sheet.dart';
import 'package:todo_app/ui/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNav(),
      floatingActionButton: buildFloatingActionBottun(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSizeWidget buildAppBar() => AppBar(
        title: const Text("To Do List"),
      );

  Widget buildBottomNav() => BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: AppColors.unClickedIcon,
              ),
              label: ""),
        ]),
      );

  Widget buildFloatingActionBottun() => FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (_) => AddBottomSheet());
        },
        child: const Icon(Icons.add),
      );
}
