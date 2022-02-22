import 'package:flutter/material.dart';

class DragScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drag Scroll Page'), titleSpacing: 0),
      body: Stack(
        children: [
          SizedBox(
            // color: Colors.amber,
            height: 600,
            child: Image.asset(
              'asset/image/animal/burung.jpg',
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            expand: true,
            initialChildSize: 0.45,
            minChildSize: 0.2,
            // maxChildSize: 0.75,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
