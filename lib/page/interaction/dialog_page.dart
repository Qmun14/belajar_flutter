import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void openSimpleDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Simple -1'),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            children: [
              Text('Simple -2'),
              Text('Simple -3'),
              Text('Simple -4'),
              Text('Simple -5'),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close')),
            ],
          );
        });
  }

  void openAboutDialog() {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AboutDialog(
    //         applicationIcon: Image.asset(
    //           'asset/image/profile.jpg',
    //           width: 60,
    //           height: 60,
    //           fit: BoxFit.cover,
    //         ),
    //         applicationName: 'Belajar Flutter',
    //         applicationVersion: '1.3.0',
    //         applicationLegalese: '©Copyright QmunApps 2022',
    //       );
    //     });
    showAboutDialog(
      context: context,
      applicationIcon: Image.asset(
        'asset/image/profile.jpg',
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
      applicationName: 'Belajar Flutter',
      applicationVersion: '1.3.0',
      applicationLegalese: '©Copyright QmunApps 2022',
    );
  }

  void openAlertDialog() {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete'),
            // contentPadding: EdgeInsets.symmetric(
            //   horizontal: 10,
            //   vertical: 10,
            // ),
            content: Text('Are you sure to delete this Item ?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Item has been deleted!');
                  },
                  child: Text('Delete')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Cancelled Deleted!');
                  },
                  child: Text('Cancel')),
            ],
          );
        });
  }

  void openCupertinoAlertDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure to delete this Item ?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  print('Item has been deleted!');
                },
                child: Text('Delete')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  print('Cancelled Deleted!');
                },
                child: Text('Cancel')),
          ],
        );
      },
    );
  }

  void openPopUpMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(16, 400, 400, 60),
      items: [
        PopupMenuItem(child: Text('Menu-1'), value: 'Menu 1'),
        PopupMenuItem(child: Text('Menu-2'), value: 'Menu 2'),
        PopupMenuItem(child: Text('Menu-3'), value: 'Menu 3'),
        PopupMenuItem(child: Text('Menu-4'), value: 'Menu 4'),
        PopupMenuItem(child: Text('Menu-5'), value: 'Menu 5'),
      ],
    );
  }

  void openModalButtomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            const SizedBox(height: 8),
            const Divider(
              thickness: 3,
              color: Colors.grey,
              indent: 150,
              endIndent: 150,
            ),
            ListTile(
              title: const Text(
                'Modal Bottom Sheet',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.clear),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
          ],
        );
      },
      backgroundColor: Colors.amber[100],
      enableDrag: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext ctx) {
    showBottomSheet(
      context: ctx,
      builder: (context1) {
        return Container(
          // height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'asset/image/profile.jpg',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Name Profile'),
              SizedBox(height: 8),
              Text('Email : email.com'),
              SizedBox(height: 16),
              Text('Name Profile'),
              SizedBox(height: 8),
              Text('Email : email.com'),
              SizedBox(height: 16),
            ],
          ),
        );
      },
      elevation: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog'), titleSpacing: 0),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        ElevatedButton(
            onPressed: () => openSimpleDialog(),
            child: const Text('Simple Dialog')),
        ElevatedButton(
            onPressed: () => openAboutDialog(),
            child: const Text('About Dialog')),
        ElevatedButton(
            onPressed: () => openAlertDialog(),
            child: const Text('Alert Dialog')),
        ElevatedButton(
            onPressed: () => openCupertinoAlertDialog(),
            child: const Text('Cupertino Alert Dialog')),
        ElevatedButton(
            onPressed: () => openPopUpMenu(), child: const Text('Pop Up Menu')),
        Builder(builder: (ctx) {
          return ElevatedButton(
              onPressed: () => openBottomSheet(ctx),
              child: const Text('Bottom Sheet'));
        }),
        ElevatedButton(
            onPressed: () => openModalButtomSheet(),
            child: const Text('Modal Buttomsheet')),
      ]),
    );
  }
}
