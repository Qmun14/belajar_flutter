import 'package:flutter/material.dart';

class ListPageDynamis extends StatefulWidget {
  @override
  State<ListPageDynamis> createState() => _ListPageDynamisState();
}

class _ListPageDynamisState extends State<ListPageDynamis> {
  final List<String> _fruits = [
    'Semangka',
    'Anggur',
    'Strawberry',
    'Nanas',
    'Jeruk',
    'Pepaya',
    'Melon',
    'Kiwi',
    'Durian',
    'Apel',
    'Pisang'
  ];

  void addItem() {
    _fruits.add('Buah');
    setState(() {});
  }

  void deleteItem(int indexItem) {
    _fruits.removeAt(indexItem);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page Dynamis'),
        titleSpacing: 0,
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        thickness: 5,
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.black,
          ),
          itemCount: _fruits.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(_fruits[index]),
              trailing: IconButton(
                onPressed: () => deleteItem(index),
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addItem(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
