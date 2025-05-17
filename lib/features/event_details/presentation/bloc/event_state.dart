// Event state
import 'package:equatable/equatable.dart';
import 'package:user_list/features/event_details/domain/entities/event_entity.dart';
import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';

class EventState extends Equatable {
  final bool isLoading;
  final EventEntity? event;
  final String selectedSlotGroup;
  final String? errorMessage;

  // Search results per tab
  final Map<String, TabSearchState> tabSearchStates;

  const EventState({
    this.isLoading = false,
    this.event,
    this.selectedSlotGroup = '',
    this.tabSearchStates = const {},
    this.errorMessage,
  });

  EventState copyWith({
    bool? isLoading,
    EventEntity? event,
    String? selectedSlotGroup,
    Map<String, TabSearchState>? tabSearchStates,
    String? errorMessage,
  }) {
    return EventState(
      isLoading: isLoading ?? this.isLoading,
      event: event ?? this.event,
      selectedSlotGroup: selectedSlotGroup ?? this.selectedSlotGroup,
      tabSearchStates: tabSearchStates ?? this.tabSearchStates,
      errorMessage: errorMessage,
    );
  }

  // Helper to get search state for a specific tab
  TabSearchState getSearchStateForTab(String tabId) {
    return tabSearchStates[tabId] ?? const TabSearchState();
  }

  // Helper to update search state for a specific tab
  EventState updateTabSearchState(String tabId, TabSearchState state) {
    final newTabStates = Map<String, TabSearchState>.from(tabSearchStates);
    newTabStates[tabId] = state;
    return copyWith(tabSearchStates: newTabStates);
  }

  @override
  List<Object?> get props => [
    isLoading,
    event,
    selectedSlotGroup,
    tabSearchStates,
    errorMessage,
  ];
}

// Search state for each tab
class TabSearchState extends Equatable {
  final bool isLoading;
  final List<ResourceEntity> resources;
  final String? errorMessage;

  const TabSearchState({
    this.isLoading = false,
    this.resources = const [],
    this.errorMessage,
  });

  TabSearchState copyWith({
    bool? isLoading,
    List<ResourceEntity>? resources,
    String? errorMessage,
  }) {
    return TabSearchState(
      isLoading: isLoading ?? this.isLoading,
      resources: resources ?? this.resources,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, resources, errorMessage];
}
