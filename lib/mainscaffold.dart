import 'package:flutter/material.dart';
import 'package:familytasks/settingspage.dart';
import 'package:familytasks/todopage.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget appBar;
  final Widget bottomNavigationBar;
  final Widget floatingActionButton;

  MainScaffold(
      {required this.body,
      required this.appBar,
      required this.bottomNavigationBar,
      required this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            InkWell(
              child: const SizedBox(
                height: 64.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: Text('Menu'),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctxt) => const SettingsPage(title: "Settings")),
                );
              },
            ),
            ListTile(
              title: const Text("Todo's"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctxt) => const ToDoPage(title: "Todo's")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
