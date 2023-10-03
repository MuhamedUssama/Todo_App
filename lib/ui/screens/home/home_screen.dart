import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/bottom_sheets/add_bottom_sheet.dart';
import 'package:todo_app/ui/screens/home/tabs/list/list_tabs.dart';
import 'package:todo_app/ui/screens/home/tabs/settings/setting_tabs.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: currentSelectedIndex == 0 ? const ListTab() : const SettingTab(),
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
        child: BottomNavigationBar(
            onTap: (index) {
              currentSelectedIndex = index;
              setState(() {});
            },
            currentIndex: currentSelectedIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: ""),
            ]),
      );

  Widget buildFloatingActionBottun() => FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: AddBottomSheet(),
                  ));
        },
        child: const Icon(Icons.add),
      );
}
