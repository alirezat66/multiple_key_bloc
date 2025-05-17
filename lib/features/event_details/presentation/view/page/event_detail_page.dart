import 'package:user_list/core/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/core/extensions/theme_extension.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_event.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_state.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_cubit.dart';

import 'package:user_list/features/event_details/presentation/view/widget/custom_search_bar.dart';
import 'package:user_list/features/event_details/presentation/view/widget/resource_list_page.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  EventDetailPageState createState() => EventDetailPageState();
}

class EventDetailPageState extends State<EventDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _slotGroupNames = [];
  final TextEditingController _searchController = TextEditingController();
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    context.read<EventBloc>().add(LoadEventEvent());

    _debouncer = Debouncer(delay: const Duration(milliseconds: 500));
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _debouncer.cancel();
    super.dispose();
  }

  void _initializeTabController(List<String> slotGroupNames) {
    if (_slotGroupNames != slotGroupNames) {
      _slotGroupNames = slotGroupNames;
      _tabController = TabController(
        length: _slotGroupNames.length,
        vsync: this,
      );

      // Add listener to update selected slot group when tab changes
      _tabController.addListener(() {
        if (!_tabController.indexIsChanging &&
            _tabController.index < _slotGroupNames.length) {
          final selectedSlotGroup = _slotGroupNames[_tabController.index];
          final currentState = context.read<EventBloc>().state;

          if (currentState.selectedSlotGroup != selectedSlotGroup) {
            context.read<EventBloc>().add(
              SelectSlotGroupEvent(selectedSlotGroup),
            );

            // Dismiss keyboard when switching tabs
            FocusScope.of(context).unfocus();

            // Reset search bar focus state
            context.read<ToggleCubit>().setSearchBarFocus(false);

            // Trigger search for the new tab with the current search query
            _onSearchChanged();
          }
        }
      });
    }
  }

  void _onSearchChanged() {
    if (_slotGroupNames.isNotEmpty) {
      final currentTabId = 'tab_${_slotGroupNames[_tabController.index]}';
      _debouncer.run(() {
        context.read<EventBloc>().add(
          SearchEvent(query: _searchController.text, tabId: currentTabId),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToggleCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: BlocBuilder<EventBloc, EventState>(
            buildWhen:
                (previous, current) =>
                    previous.event?.categoryName != current.event?.categoryName,
            builder: (context, state) {
              return state.event != null
                  ? Text(
                    state.event!.categoryName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  : const SizedBox();
            },
          ),
        ),
        body: BlocConsumer<EventBloc, EventState>(
          listenWhen:
              (previous, current) =>
                  previous.event?.slotGroups.length !=
                  current.event?.slotGroups.length,
          listener: (context, state) {
            if (state.event != null) {
              _initializeTabController(
                state.event!.slotGroups.map((e) => e.slotGroupName).toList(),
              );
              // Trigger initial search after tabs are initialized
              _onSearchChanged();
            }
          },
          buildWhen:
              (previous, current) =>
                  previous.isLoading != current.isLoading ||
                  previous.errorMessage != current.errorMessage ||
                  previous.event != current.event,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage != null) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else if (state.event != null && _slotGroupNames.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tab bar
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs:
                        _slotGroupNames.map((name) => Tab(text: name)).toList(),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                  ),

                  // Event name header
                  // Search bar
                  CustomSearchBar(
                    tabId:
                        'event_detail_page_search', // A unique ID for the search bar
                    controller: _searchController,
                  ),

                  // Event name header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: 'Event: ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          TextSpan(
                            text: state.event!.eventName,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: context.colorScheme.secondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Resources list for selected tab
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children:
                          _slotGroupNames.map((slotGroupName) {
                            final tabId = 'tab_$slotGroupName';
                            return ResourceListPage(
                              key: ValueKey(tabId),
                              slotGroupName: slotGroupName,
                              tabId: tabId,
                            );
                          }).toList(),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
