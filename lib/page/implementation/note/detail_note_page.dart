import 'package:belajar_flutter/model/note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailNotePage extends StatelessWidget {
  final Note note;

  const DetailNotePage({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date =
        note.date == null ? DateTime.now() : DateTime.parse(note.date!);

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Note'), titleSpacing: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            note.title ?? '',
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat('d MMM yyyy').format(date),
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 139, 138, 138),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            note.body ?? '',
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
