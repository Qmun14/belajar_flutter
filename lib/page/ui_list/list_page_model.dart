import 'package:belajar_flutter/model/animal.dart';
import 'package:belajar_flutter/page/ui_list/detail_page.dart';

import 'package:flutter/material.dart';

class ListPageModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page Model'),
        titleSpacing: 0,
      ),
      body: ListView.builder(
        itemCount: listAnimal.length,
        itemBuilder: (context, index) {
          Animal animal = listAnimal[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(animal: animal),
                ),
              );
            },
            child: itemAnimal(animal, index),
          );
        },
      ),
    );
  }

  Widget itemAnimal(Animal animal, int index) {
    return Card(
      margin: EdgeInsets.fromLTRB(
          16, index == 0 ? 16 : 8, 16, index == listAnimal.length ? 16 : 8),
      elevation: 4,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
            child: Image.asset(
              animal.image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  animal.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(animal.move)
              ],
            ),
          ),
          const Icon(Icons.navigate_next),
          const SizedBox(
            width: 8,
          )
        ],
      ),
    );
  }
}
