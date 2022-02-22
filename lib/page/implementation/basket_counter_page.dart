import 'package:flutter/material.dart';

class BasketCounterPage extends StatefulWidget {
  @override
  _BasketCounterPageState createState() => _BasketCounterPageState();
}

class _BasketCounterPageState extends State<BasketCounterPage> {
  int _pointA = 0;
  int _pointB = 0;

  void addPointA(int point) {
    _pointA += point;
    setState(() {});
  }

  void addPointB(int point) {
    _pointB += point;
    setState(() {});
  }

  void ressetPoint() {
    _pointA = 0;
    _pointB = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basket Counter Page'), titleSpacing: 0),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 133, 251, 255),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text('TEAM A', style: TextStyle(fontSize: 30)),
                      const SizedBox(height: 30),
                      Text('$_pointA', style: const TextStyle(fontSize: 70)),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () => addPointA(1),
                          child: const Text('+1 Point')),
                      ElevatedButton(
                          onPressed: () => addPointA(2),
                          child: const Text('+2 Point')),
                      ElevatedButton(
                          onPressed: () => addPointA(3),
                          child: const Text('+3 Point')),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 255, 191, 0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text('TEAM B', style: TextStyle(fontSize: 30)),
                      const SizedBox(height: 30),
                      Text('$_pointB', style: const TextStyle(fontSize: 70)),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () => addPointB(1),
                          child: const Text('+1 Point')),
                      ElevatedButton(
                          onPressed: () => addPointB(2),
                          child: const Text('+2 Point')),
                      ElevatedButton(
                          onPressed: () => addPointB(3),
                          child: const Text('+3 Point')),
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => ressetPoint(),
                  child: const Text('Resset Point'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Color.fromARGB(255, 53, 52, 52))),
                ),
                const SizedBox(height: 16)
              ],
            ),
          )
        ],
      ),
    );
  }
}
