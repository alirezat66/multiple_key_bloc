import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_event.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_state.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_cubit.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_state.dart';
import 'package:user_list/features/event_details/presentation/view/widget/custom_search_bar.dart';
import 'package:user_list/features/event_details/presentation/view/widget/resource_item.dart';

class ResourceListPage extends StatefulWidget {
  final String slotGroupName;
  final String tabId;

  const ResourceListPage({
    super.key,
    required this.slotGroupName,
    required this.tabId,
  });

  @override
  ResourceListPageState createState() => ResourceListPageState();
}

class ResourceListPageState extends State<ResourceListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Trigger search when the page is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventBloc>().add(
        SearchEvent(query: '', tabId: widget.tabId),
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar for this tab
        CustomSearchBar(tabId: widget.tabId, controller: _searchController),

        // Resource list
        Expanded(
          child: BlocBuilder<EventBloc, EventState>(
            buildWhen: (previous, current) {
              final prevSearchState = previous.getSearchStateForTab(
                widget.tabId,
              );
              final currentSearchState = current.getSearchStateForTab(
                widget.tabId,
              );

              return prevSearchState != currentSearchState;
            },
            builder: (context, state) {
              final searchState = state.getSearchStateForTab(widget.tabId);

              if (searchState.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (searchState.errorMessage != null) {
                return Center(
                  child: Text('Error: ${searchState.errorMessage}'),
                );
              } else {
                final resources = searchState.resources;
                if (resources.isEmpty) {
                  return const Center(child: Text('No resources found'));
                } else {
                  return BlocBuilder<ToggleCubit, ToggleState>(
                    buildWhen:
                        (previous, current) => resources.any(
                          (r) =>
                              previous.toggledItems[r.userId] !=
                              current.toggledItems[r.userId],
                        ),
                    builder: (context, toggleState) {
                      return CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final resource = resources[index];
                              return ResourceItem(
                                resource: resource,
                                isExpanded:
                                    toggleState.toggledItems[resource.userId] ??
                                    false,
                                onToggle: () {
                                  context.read<ToggleCubit>().toggleItem(
                                    resource.userId,
                                  );
                                },
                              );
                            }, childCount: resources.length),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
