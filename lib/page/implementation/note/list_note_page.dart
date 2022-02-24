import 'package:belajar_flutter/db/db_note.dart';
import 'package:belajar_flutter/model/note.dart';
import 'package:belajar_flutter/page/implementation/note/add_note_page.dart';
import 'package:belajar_flutter/page/implementation/note/detail_note_page.dart';
import 'package:belajar_flutter/page/implementation/note/update_note_page.dart';
import 'package:flutter/material.dart';

class ListNotePage extends StatefulWidget {
  @override
  _ListNotePageState createState() => _ListNotePageState();
}

class _ListNotePageState extends State<ListNotePage> {
  List<Note> _listNote = [];

  void getListNote() async {
    _listNote.clear();
    _listNote = await DBNote().getAllNote();
    setState(() {});
  }

  void deleteNote(int id) {
    DBNote().deleteWhereId(id);
    getListNote();
  }

  @override
  void initState() {
    getListNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD Note'), titleSpacing: 0),
      body: _listNote.isNotEmpty
          ? ListView.builder(
              itemCount: _listNote.length,
              itemBuilder: (context, index) {
                Note note = _listNote[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailNotePage(note: note),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateNotePage(note: note)),
                        ).then((value) => getListNote());
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                  title: Text(note.title ?? ''),
                  trailing: IconButton(
                      onPressed: () {
                        deleteNote(note.id!);
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            )
          : const Center(
              child: Text('Empty'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          ).then((value) => getListNote());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
