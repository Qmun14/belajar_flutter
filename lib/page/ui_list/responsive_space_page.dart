import 'package:flutter/material.dart';

class ResponsiveSpacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Space Page'),
        titleSpacing: 0,
      ),
      body: LayoutBuilder(builder: (context, costraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: costraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                group1(),
                group2(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Column group2() {
    return Column(
      children: const [
        SizedBox(height: 30),
        Text('Don\'t have an account? Please Register.'),
        SizedBox(height: 16)
      ],
    );
  }

  Column group1() {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Center(
          child: Icon(
            Icons.account_circle,
            size: 150,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: 250,
          height: 40,
          alignment: Alignment.center,
          child: const Text('Input 1'),
          color: Colors.blue[100],
        ),
        const SizedBox(height: 16),
        Container(
          width: 250,
          height: 40,
          alignment: Alignment.center,
          child: const Text('Input 2'),
          color: Colors.blue[100],
        ),
        const SizedBox(height: 32),
        ElevatedButton(onPressed: () {}, child: const Text('LOGIN')),
      ],
    );
  }
}
