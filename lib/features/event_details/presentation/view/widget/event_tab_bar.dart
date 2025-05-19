import 'package:flutter/material.dart';

class EventTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabNames;

  const EventTabBar({
    super.key,
    required this.tabController,
    required this.tabNames,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabs: tabNames.map((name) => Tab(text: name)).toList(),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.black,
    );
  }
}
