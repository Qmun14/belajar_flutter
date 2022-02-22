import 'package:belajar_flutter/page/navigation/fragments/fragment_dashboard.dart';
import 'package:belajar_flutter/page/navigation/fragments/fragment_notification.dart';
import 'package:belajar_flutter/page/navigation/fragments/fragment_setting.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final List _listFragment = [
    {'title': 'Dashboard', 'fragment': FragmentDashboard()},
    {'title': 'Notification', 'fragment': FragmentNotfication()},
    {'title': 'Settings', 'fragment': FragmentSetting()}
  ];
  int _currentFragment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_listFragment[_currentFragment]['title']),
          titleSpacing: 0),
      drawer: _drawer(),
      body: _listFragment[_currentFragment]['fragment'],
    );
  }

  Drawer _drawer() => Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset('asset/image/profile.jpg',
                          height: 80, width: 80, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Ma\'mun Ramdhan',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'mamunramdhan@gmail.com',
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                )),
            ListTile(
              onTap: () {
                setState(() => _currentFragment = 0);
                Navigator.pop(context);
              },
              leading: Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              onTap: () {
                setState(() => _currentFragment = 1);
                Navigator.pop(context);
              },
              leading: Icon(Icons.notifications),
              title: const Text('Notification'),
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              onTap: () {
                setState(() => _currentFragment = 2);
                Navigator.pop(context);
              },
              leading: Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: const Icon(Icons.navigate_next),
            ),
            Divider(color: Colors.grey),
            ListTile(
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              title: const Text('Log out'),
              trailing: const Icon(Icons.navigate_next),
            ),
          ],
        ),
      );
}
