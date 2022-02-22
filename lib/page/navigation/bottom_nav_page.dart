import 'package:belajar_flutter/page/navigation/fragments/fragment_dashboard.dart';
import 'package:belajar_flutter/page/navigation/fragments/fragment_notification.dart';
import 'package:belajar_flutter/page/navigation/fragments/fragment_setting.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _indexNav = 0;
  final List _listNav = [
    {
      'label': 'Dashboard',
      'icon_on': Icons.dashboard,
      'icon_off': Icons.dashboard_outlined,
      'fragment': FragmentDashboard(),
    },
    {
      'label': 'Notification',
      'icon_on': Icons.notifications,
      'icon_off': Icons.notifications_outlined,
      'fragment': FragmentNotfication(),
    },
    {
      'label': 'Settings',
      'icon_on': Icons.settings,
      'icon_off': Icons.settings_applications,
      'fragment': FragmentSetting(),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listNav[_indexNav]['fragment'],
      bottomNavigationBar: _bottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  BottomNavigationBar _bottomNav() {
    return BottomNavigationBar(
        backgroundColor: Colors.blue[50],
        currentIndex: _indexNav,
        onTap: (value) => setState(() => _indexNav = value),
        items: _listNav.map((e) {
          return BottomNavigationBarItem(
            activeIcon: Icon(e['icon_on']),
            icon: Icon(e['icon_off']),
            label: e['label'],
          );
        }).toList());
  }
}
