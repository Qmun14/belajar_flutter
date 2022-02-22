import 'package:flutter/material.dart';

class ActionPage extends StatefulWidget {
  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  List _animals = [
    'Cat',
    'Chicken',
    'Cow',
    'Dog',
    'Horse',
    'Fish',
    'Turtle',
    'Whale',
    'Shark',
    'Dolphin',
  ];

  int _boxQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Action Page'), titleSpacing: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              customButton(),
              const SizedBox(height: 16),
              ListTile(
                  title: const Text('Ini Bagian Dismissable'),
                  tileColor: Colors.green[800]),
              buildDismissable(),
              const SizedBox(height: 16),
              ListTile(
                  title: const Text('Ini Bagian Draggable'),
                  tileColor: Colors.green[800]),
              const SizedBox(height: 16),
              buildDraggable(),
              const SizedBox(height: 16),
              ListTile(
                  title: const Text('Ini Bagian Interractive Viewer'),
                  tileColor: Colors.green[800]),
              const SizedBox(height: 16),
              InteractiveViewer(
                child: Image.asset(
                  'asset/image/animal/kucing.jpg',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDraggable() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Draggable(
          data: 12,
          feedback: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 6, offset: Offset.zero),
              ],
              color: Colors.deepPurple[200],
            ),
            child: const Icon(Icons.add_shopping_cart),
          ),
          child: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.lightGreenAccent,
            child: const Center(
              child: Text('Tambah ke Keranjang', textAlign: TextAlign.center),
            ),
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.grey,
            child: Container(
              alignment: Alignment.center,
              child: Text('Sent to Cart Box..'),
            ),
          ),
        ),
        DragTarget(
          builder: (context, candidateData, rejectedData) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 100.0,
              width: 100.0,
              color: Colors.amber[300],
              alignment: Alignment.center,
              child: Text('Box Reicived : $_boxQuantity'),
            );
          },
          onAccept: (int data) {
            setState(() {
              _boxQuantity += data;
            });
          },
        )
      ],
    );
  }

  ListView buildDismissable() {
    return ListView.builder(
      itemCount: _animals.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(_animals[index]),
          background: Container(color: Colors.red),
          onDismissed: (direction) {
            setState(() => _animals.removeAt(index));
          },
          child: ListTile(
            title: Text('${index + 1}. ' + _animals[index]),
          ),
        );
      },
    );
  }

  Widget customButton() {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: Colors.amber[300],
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        splashColor: Colors.lightBlueAccent,
        onTap: () {
          print('Custom Button di Click!');
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Custom Button adada'),
        ),
      ),
    );
  }
}
