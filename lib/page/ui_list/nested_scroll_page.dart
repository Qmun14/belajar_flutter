import 'package:belajar_flutter/model/animal.dart';
import 'package:flutter/material.dart';

class NestedScrollPage extends StatelessWidget {
  final List<String> _tabs = ['Tab 1', 'Tab 2'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: Text('Nested Scroll Page'),
                    pinned: true,
                    expandedHeight: 200,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      tabs: _tabs.map((element) => Text(element)).toList(),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
              children: _tabs.map((element) {
                return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (context) {
                      return CustomScrollView(
                        key: PageStorageKey(element),
                        slivers: [
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(8),
                            sliver: SliverFixedExtentList(
                              itemExtent: 48,
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                Animal animal = listAnimal[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    child: Text('${index + 1}'),
                                  ),
                                  title: Text(animal.name),
                                );
                              }, childCount: listAnimal.length),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
