import 'package:belajar_flutter/db/pref.dart';
import 'package:flutter/material.dart';

class PrefPage extends StatefulWidget {
  @override
  _PrefPageState createState() => _PrefPageState();
}

class _PrefPageState extends State<PrefPage> {
  String? _name;
  double? _age;
  bool? _likeSport;

  void getData() async {
    _name = await Pref.getName();
    _age = await Pref.getAge();
    _likeSport = await Pref.getLikeSport();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Save Preference Page'), titleSpacing: 0),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Name'),
            subtitle: Text(_name ?? 'Kosong'),
          ),
          const Divider(thickness: 2),
          ListTile(
            title: const Text('Age'),
            subtitle: Text(_age != null ? '$_age' : 'Kosong'),
          ),
          const Divider(thickness: 2),
          ListTile(
            title: const Text('Like Sport'),
            subtitle: Text(_likeSport != null ? '$_likeSport' : 'Kosong'),
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Pref.saveName('Ma\'mun');
                Pref.saveAge(31);
                Pref.saveLikeSport(true);
                getData();
              },
              child: const Text('Send Data'),
            ),
          )
        ],
      ),
    );
  }
}
