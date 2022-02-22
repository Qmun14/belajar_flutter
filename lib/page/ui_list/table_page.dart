import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  final List<Map> _listData = [
    {'title': 'Order', 'content': 'Make Your Order Here'},
    {'title': 'Payment', 'content': 'Here Payment can you use'},
    {'title': 'Sent', 'content': 'Your order on the way'},
    {'title': 'Arrive', 'content': 'Your order has arrived'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Page'), titleSpacing: 0),
      body: ListView(
        children: [
          _staticTable(),
          const SizedBox(height: 30),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FractionColumnWidth(.2),
              1: FractionColumnWidth(.7),
            },
            border: TableBorder.all(),
            children: _listData.map((e) {
              return TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e['title']),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e['content']),
                ),
              ]);
            }).toList(),
          )
        ],
      ),
    );
  }

  Table _staticTable() {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FractionColumnWidth(.4),
        1: FractionColumnWidth(.25),
        2: FractionColumnWidth(.35),
      },
      border: TableBorder.all(),
      children: [
        TableRow(children: [
          Container(
            height: 32,
            color: Colors.green,
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Container(
              height: 32,
              width: 32,
              color: Colors.red,
            ),
          ),
          Container(
            height: 64,
            color: Colors.blue,
          ),
        ]),
        TableRow(children: [
          const TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(child: Text('Cel 1 Row 2')),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              height: 32,
              width: 32,
              color: Colors.red,
            ),
          ),
          const Center(child: Text('Cel 3 Row 2'))
        ]),
      ],
    );
  }
}
