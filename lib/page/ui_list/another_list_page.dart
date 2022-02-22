import 'package:flutter/material.dart';

class AnotherListPage extends StatefulWidget {
  @override
  State<AnotherListPage> createState() => _AnotherListPageState();
}

class _AnotherListPageState extends State<AnotherListPage> {
  final List _categories = [
    'Action',
    'Drama',
    'Fantasy',
    'Horror',
    'Romance',
    'Sci-fi',
    'Serial',
    'Thriller',
  ];

  final List<Map> _listStep = [
    {'title': 'Order', 'content': 'Make Your Order Here'},
    {'title': 'Payment', 'content': 'Here Payment can you use'},
    {'title': 'Sent', 'content': 'Your order on the way'},
    {'title': 'Arrive', 'content': 'Your order has arrived'},
  ];

  int _currentStep = 0;
  int _currentStack = 0;

  void deleteChip(int index) {
    _categories.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Another List Page'), titleSpacing: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _wrap(),
            _pageView(),
            const SizedBox(height: 30),
            _stepper(),
            const SizedBox(height: 30),
            _indexedStack(),
            _buttonCounterStack(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buttonCounterStack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              if (_currentStack > 0) {
                setState(() => _currentStack -= 1);
              }
            },
            child: const Text('Minus 1')),
        const SizedBox(width: 16),
        Text('Layer $_currentStack'),
        const SizedBox(width: 16),
        ElevatedButton(
            onPressed: () {
              if (_currentStack < _listStep.length - 1) {
                setState(() => _currentStack += 1);
              }
            },
            child: const Text('Plus 1')),
      ],
    );
  }

  Widget _indexedStack() {
    return IndexedStack(
      index: _currentStack,
      children: List.generate(_listStep.length, (index) {
        Map itemStack = _listStep[index];
        return Card(
          color: Colors.blue[100],
          margin: const EdgeInsets.all(16),
          elevation: 4,
          child: Container(
            width: double.maxFinite,
            height: 200,
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Text(itemStack['title'], style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Text(itemStack['content']),
              ],
            ),
          ),
        );
      }),
    );
  }

  Stepper _stepper() {
    return Stepper(
      physics: const NeverScrollableScrollPhysics(),
      onStepContinue: () {
        if (_currentStep < _listStep.length - 1) {
          setState(() => _currentStep += 1);
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() => _currentStep -= 1);
        }
      },
      onStepTapped: (newStep) => setState(() => _currentStep = newStep),
      currentStep: _currentStep,
      steps: List.generate(_listStep.length, (index) {
        Map itemStep = _listStep[index];
        return Step(
          title: Text(itemStep['title']),
          content: Container(
            padding: const EdgeInsets.all(8),
            width: double.maxFinite,
            height: 50,
            color: Colors.amber[100],
            child: Text(itemStep['content']),
          ),
          isActive: _currentStep == index,
        );
      }),
    );
  }

  SizedBox _pageView() {
    return SizedBox(
      height: 200,
      child: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: _categories.map((category) {
          return Card(
            elevation: 8,
            margin: const EdgeInsets.all(16),
            color: Colors.purpleAccent,
            child: Center(child: Text(category)),
          );
        }).toList(),
      ),
    );
  }

  Padding _wrap() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        children: List.generate(_categories.length, (index) {
          return Chip(
            backgroundColor: Colors.blue[100],
            label: Text(_categories[index]),
            avatar: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            deleteIcon: const Icon(
              Icons.clear,
              color: Colors.red,
            ),
            onDeleted: () => deleteChip(index),
          );
        }),
      ),
    );
  }
}
