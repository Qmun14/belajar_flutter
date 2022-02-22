import 'package:flutter/material.dart';

class TabbarPage extends StatefulWidget {
  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Page'),
          titleSpacing: 0,
          bottom: const TabBar(
              indicatorColor: Colors.amber,
              indicatorWeight: 4,
              tabs: [
                Tab(
                  icon: Icon(Icons.payment),
                  iconMargin: EdgeInsets.only(bottom: 4),
                  text: 'Payment',
                  height: 50,
                ),
                Tab(
                  icon: Icon(Icons.history),
                  iconMargin: EdgeInsets.only(bottom: 4),
                  text: 'History',
                  height: 50,
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Ini Tab Payment'),
            ),
            Center(
              child: Text('Ini Tab History'),
            ),
          ],
        ),
      ),
    );
  }
}
