import 'package:user_list/core/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/core/extensions/theme_extension.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_event.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_state.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_cubit.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_state.dart';

import 'package:user_list/features/event_details/presentation/view/widget/resource_item.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  EventDetailPageState createState() => EventDetailPageState();
}

class EventDetailPageState extends State<EventDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _slotGroupNames = [];
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late Debouncer _debouncer;

  // Animation controllers for the search bar cancel button
  late AnimationController _searchAnimationController;
  late Animation<double> _cancelButtonAnimation;

  @override
  void initState() {
    super.initState();
    // Load the event data
    context.read<EventBloc>().add(LoadEventEvent());

    // Initialize debouncer for search
    _debouncer = Debouncer(delay: const Duration(milliseconds: 300));
    _searchController.addListener(_onSearchChanged);

    // Set up search animation
    _searchAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _cancelButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _searchAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Listen for focus changes to trigger the cancel button animation
    _searchFocusNode.addListener(() {
      if (_searchFocusNode.hasFocus) {
        _searchAnimationController.forward();
      } else if (_searchController.text.isEmpty) {
        _searchAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _debouncer.cancel();
    _searchAnimationController.dispose();
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
            // Select the new slot group (this will also trigger a search)
            context.read<EventBloc>().add(
              SelectSlotGroupEvent(selectedSlotGroup),
            );

            // Clear search focus to hide keyboard when switching tabs
            if (_searchFocusNode.hasFocus) {
              FocusScope.of(context).unfocus();
            }
          }
        }
      });
    }
  }

  void _onSearchChanged() {
    _debouncer.run(() {
      context.read<EventBloc>().add(SearchEvent(query: _searchController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                // Slot Group Tabs
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: _slotGroupNames.map((name) => Tab(text: name)).toList(),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                ),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Search field
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey[600]),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  focusNode: _searchFocusNode,
                                  decoration: const InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              // Clear button
                              if (_searchController.text.isNotEmpty)
                                GestureDetector(
                                  onTap: () {
                                    _searchController.clear();
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.grey[600],
                                    size: 20,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                      // Cancel button with animation
                      SizeTransition(
                        sizeFactor: _cancelButtonAnimation,
                        axis: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
                              _searchController.clear();
                              FocusScope.of(context).unfocus();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Event name
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
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

                // Resources list for current tab
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children:
                        _slotGroupNames.map((slotGroupName) {
                          return _ResourceList(
                            key: ValueKey(slotGroupName),
                            slotGroupName: slotGroupName,
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
    );
  }
}

class _ResourceList extends StatelessWidget {
  final String slotGroupName;

  const _ResourceList({super.key, required this.slotGroupName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      buildWhen:
          (previous, current) =>
              previous.selectedSlotGroup != current.selectedSlotGroup ||
              previous.searchResults != current.searchResults ||
              previous.isSearching != current.isSearching ||
              previous.searchError != current.searchError,
      builder: (context, state) {
        // Only show this list if it matches the currently selected slot group
        if (state.selectedSlotGroup != slotGroupName) {
          return const SizedBox.shrink();
        }

        if (state.isSearching) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.searchError != null) {
          return Center(child: Text('Error: ${state.searchError}'));
        } else {
          final resources = state.searchResults;
          if (resources.isEmpty) {
            return const Center(child: Text('No resources found'));
          }

          // Use BlocBuilder for ToggleCubit to efficiently rebuild only when toggle states change
          return BlocBuilder<ToggleCubit, ToggleState>(
            builder: (context, toggleState) {
              return ListView.builder(
                itemCount: resources.length,
                itemBuilder: (context, index) {
                  final resource = resources[index];
                  return ResourceItem(
                    resource: resource,
                    isExpanded:
                        toggleState.toggledItems[resource.userId] ?? false,
                    onToggle: () {
                      context.read<ToggleCubit>().toggleItem(resource.userId);
                    },
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
