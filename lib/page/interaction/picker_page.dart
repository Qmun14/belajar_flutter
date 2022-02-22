import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PickerPage extends StatefulWidget {
  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  Uint8List? _imageData;

  void getDate() async {
    DateTime? result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (result != null) {
      print(result.toIso8601String());
      DateFormat dateFormat = DateFormat("dd-MM-yyyy");
      String date = dateFormat.format(result);
      print('Date : $date');
      print(result.microsecondsSinceEpoch);
    }
  }

  void getDateRange() async {
    DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (result != null) {
      print(result.start.toIso8601String());
      print(result.end.toIso8601String());
      print('${result.duration.inDays} Hari');
      print('${result.duration.inHours} Jam');
    }
  }

  void getTime() async {
    TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (result != null) {
      print('Hour : ${result.hour}');
      print('Minutes : ${result.minute}');
      print('Hour : ${result.hour} Minutes : ${result.minute}');
      print(result.format(context));
    }
  }

  void getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      print('=========================================image');
      print(image.name);
      Uint8List imageByte = await image.readAsBytes();
      File imageFile = File(image.path);
      print('=========================================image');
      setState(() {
        _imageData = imageByte;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picker Page'), titleSpacing: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => getDate(),
            child: const Text('Date Picker'),
          ),
          ElevatedButton(
            onPressed: () => getDateRange(),
            child: const Text('Date Range Picker'),
          ),
          ElevatedButton(
            onPressed: () => getTime(),
            child: const Text('Time Picker'),
          ),
          ElevatedButton(
            onPressed: () => getImage(ImageSource.gallery),
            child: const Text('Image Picker Gallery'),
          ),
          ElevatedButton(
            onPressed: () => getImage(ImageSource.camera),
            child: const Text('Image Picker Camera'),
          ),
          if (_imageData != null) Image.memory(_imageData!),
        ],
      ),
    );
  }
}
