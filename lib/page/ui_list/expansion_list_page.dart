import 'package:flutter/material.dart';

class ExpansionListPage extends StatefulWidget {
  @override
  _ExpansionListPageState createState() => _ExpansionListPageState();
}

class _ExpansionListPageState extends State<ExpansionListPage> {
  final List<Map> _listPanel = [
    {'title': 'Order', 'content': 'Make Your Order Here'},
    {'title': 'Payment', 'content': 'Here Payment can you use'},
    {'title': 'Sent', 'content': 'Your order on the way'},
    {'title': 'Arrive', 'content': 'Your order has arrived'},
  ];
  List<bool> _listExpanded = [];

  void setListExpand() {
    _listExpanded.clear();
    _listPanel.forEach((element) => _listExpanded.add(false));
  }

  @override
  void initState() {
    setListExpand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expansion List Page'), titleSpacing: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 500),
                expansionCallback: (panelIndex, isExpanded) {
                  _listExpanded[panelIndex] = !_listExpanded[panelIndex];
                  setState(() {});
                },
                children: List.generate(_listPanel.length, (index) {
                  var item = _listPanel[index];
                  return ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(title: Text(item['title']));
                    },
                    canTapOnHeader: true,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(item['content']),
                        ),
                      ],
                    ),
                    isExpanded: _listExpanded[index],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
