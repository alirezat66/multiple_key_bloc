// Event state
import 'package:equatable/equatable.dart';
import 'package:user_list/features/event_details/domain/entities/event_entity.dart';
import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';

class EventState extends Equatable {
  final bool isLoading;
  final EventEntity? event;
  final String selectedSlotGroup;
  final String? errorMessage;

  // Search related fields
  final String searchQuery;
  final bool isSearching;
  final List<ResourceEntity> searchResults;
  final String? searchError;

  const EventState({
    this.isLoading = false,
    this.event,
    this.selectedSlotGroup = '',
    this.errorMessage,
    this.searchQuery = '',
    this.isSearching = false,
    this.searchResults = const [],
    this.searchError,
  });

  EventState copyWith({
    bool? isLoading,
    EventEntity? event,
    String? selectedSlotGroup,
    String? errorMessage,
    String? searchQuery,
    bool? isSearching,
    List<ResourceEntity>? searchResults,
    String? searchError,
  }) {
    return EventState(
      isLoading: isLoading ?? this.isLoading,
      event: event ?? this.event,
      selectedSlotGroup: selectedSlotGroup ?? this.selectedSlotGroup,
      errorMessage: errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      isSearching: isSearching ?? this.isSearching,
      searchResults: searchResults ?? this.searchResults,
      searchError: searchError,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    event,
    selectedSlotGroup,
    errorMessage,
    searchQuery,
    isSearching,
    searchResults,
    searchError,
  ];
}
