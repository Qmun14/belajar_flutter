import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertNotifPage extends StatefulWidget {
  @override
  _AlertNotifPageState createState() => _AlertNotifPageState();
}

class _AlertNotifPageState extends State<AlertNotifPage> {
  FToast fToast = FToast();

  void openSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Delete Item'),
        duration: Duration(milliseconds: 2500),
        action: SnackBarAction(
          label: 'Cancel',
          textColor: Colors.red,
          onPressed: () {
            print('Delete Cancelled');
          },
        ),
      ),
    );
  }

  void openToast() {
    // Fluttertoast.showToast(
    //     msg: "This is Center Short Toast",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            bottom: 16.0,
            right: 16.0,
          );
        });
  }

  void openMaterialBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      backgroundColor: Colors.greenAccent,
      content: Column(children: const [
        Text('There\'s an update, Do you want to update ?'),
      ]),
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            print('Update Data Succes!');
          },
          child: const Text('Update'),
        ),
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: const Text('Dismiss'),
        ),
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            Future.delayed(const Duration(milliseconds: 700), () {
              Navigator.pop(context);
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Alert Notification'),
        titleSpacing: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => openSnackBar(),
            child: const Text('Snack Bar'),
          ),
          ElevatedButton(
            onPressed: () => openToast(),
            child: const Text('Toast'),
          ),
          ElevatedButton(
            onPressed: () => openMaterialBanner(),
            child: const Text('Material Banner'),
          ),
        ],
      ),
    );
  }
}
