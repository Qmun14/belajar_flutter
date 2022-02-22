import 'package:belajar_flutter/model/animal.dart';
import 'package:flutter/material.dart';

class DataTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Table Page'), titleSpacing: 0),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _dataTableStatic(),
            const SizedBox(height: 15),
            _dataTableDynamic(),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _dataTableDynamic() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('No')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Move')),
            DataColumn(label: Text('Weight')),
          ],
          rows: List.generate(listAnimal.length, (index) {
            Animal animal = listAnimal[index];
            return DataRow(cells: [
              DataCell(Text('${index + 1}')),
              DataCell(Text(animal.name)),
              DataCell(Text(animal.move)),
              DataCell(Text('${animal.weight} Kg')),
            ]);
          }),
        ),
      ),
    );
  }

  SingleChildScrollView _dataTableStatic() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('No')),
            DataColumn(label: Text('Company')),
            DataColumn(label: Text('Address')),
            DataColumn(label: Text('Post Code')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('CodePro')),
              DataCell(Text('Indonesia')),
              DataCell(Text('1111111232311')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('QmunApp')),
              DataCell(Text('Bogor')),
              DataCell(Text('11133111')),
            ]),
          ],
        ),
      ),
    );
  }
}
