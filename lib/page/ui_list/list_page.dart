import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
        titleSpacing: 0,
      ),
      body: ListView(
        children: [
          const ListTile(
            tileColor: Colors.amber,
            leading: Icon(Icons.ac_unit),
            title: Text('Title'),
            trailing: Icon(Icons.navigate_next),
            subtitle: Text('Sub title'),
          ),
          const ListTile(
            tileColor: Colors.green,
            leading: Icon(Icons.access_alarms),
            title: Text('Title'),
            trailing: Icon(Icons.navigate_next),
          ),
          const ListTile(
            tileColor: Colors.purpleAccent,
            leading: CircleAvatar(
              child: Icon(Icons.alarm),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
            ),
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            // tileColor: Colors.greenAccent,
            leading: const CircleAvatar(
              foregroundColor: Colors.white,
              child: Text('1'),
            ),
            title: const Text('Title'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.red,
            height: 2,
            thickness: 2,
          ),
          ListTile(
            // tileColor: Colors.yellow,
            leading: const CircleAvatar(
              foregroundColor: Colors.white,
              child: Text('2'),
            ),
            title: const Text('Title'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
