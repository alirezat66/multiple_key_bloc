import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_state.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_cubit.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_state.dart';
import 'package:user_list/features/event_details/presentation/view/widget/resources/resource_item.dart';

class ResourceListView extends StatelessWidget {
  final String slotGroupName;

  const ResourceListView({super.key, required this.slotGroupName});

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
