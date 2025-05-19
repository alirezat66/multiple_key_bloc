import 'package:flutter/material.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_state.dart';
import 'package:user_list/features/event_details/presentation/view/widget/event_header.dart';
import 'package:user_list/features/event_details/presentation/view/widget/event_tab_bar.dart';
import 'package:user_list/features/event_details/presentation/view/widget/event_search_bar.dart';
import 'package:user_list/features/event_details/presentation/view/widget/resources/resource_list_view.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({
    super.key,
    required this.state,
    required this.tabController,
    required this.slotGroupNames,
    required this.onSearchChanged,
  });

  final EventState state;
  final TabController tabController;
  final List<String> slotGroupNames;
  final Function(String) onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EventTabBar(
          tabController: tabController,
          tabNames: slotGroupNames,
        ),
        
        // Search Bar
        EventSearchBar(onSearchChanged: onSearchChanged),

        // Event name
        EventHeader(eventName: state.event!.eventName),

        // Resources list for current tab
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: slotGroupNames.map((slotGroupName) {
              return ResourceListView(
                key: ValueKey(slotGroupName),
                slotGroupName: slotGroupName,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}