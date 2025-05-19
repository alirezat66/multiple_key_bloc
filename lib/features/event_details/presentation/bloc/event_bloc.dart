import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/core/error/exceptions.dart';
import 'package:user_list/features/event_details/domain/usecase/get_event.dart';
import 'package:user_list/features/event_details/domain/usecase/search_resources.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_event.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final GetEvent getEvent;
  final SearchResources searchResources;

  EventBloc({required this.getEvent, required this.searchResources})
    : super(const EventState()) {
    on<LoadEventEvent>(_onLoadEvent);
    on<SelectSlotGroupEvent>(_onSelectSlotGroup);
    on<SearchEvent>(_onSearch);
  }


  /// Handle loading the event
  void _onLoadEvent(LoadEventEvent event, Emitter<EventState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final eventData = await getEvent();

      // Select the first slot group by default
      final selectedSlotGroup =
          eventData.slotGroups.isNotEmpty
              ? eventData.slotGroups.first.slotGroupName
              : '';

      emit(
        state.copyWith(
          isLoading: false,
          event: eventData,
          selectedSlotGroup: selectedSlotGroup,
        ),
      );

      // Initialize search with empty query for the selected slot group
      add(SearchEvent(query: ''));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load event: ${e.toString()}',
        ),
      );
    }
  }

  /// Handle selecting a slot group (tab)
  void _onSelectSlotGroup(
    SelectSlotGroupEvent event,
    Emitter<EventState> emit,
  ) {
    if (state.selectedSlotGroup != event.slotGroupName) {
      emit(state.copyWith(selectedSlotGroup: event.slotGroupName));

      // Trigger search with current query for the newly selected slot group
      add(SearchEvent(query: state.searchQuery));
    }
  }

  /// Handle search operation
  void _onSearch(SearchEvent event, Emitter<EventState> emit) async {
    // Update search query in state
    emit(
      state.copyWith(
        searchQuery: event.query,
        isSearching: true,
        searchError: null,
      ),
    );

    try {
      // Perform search with the current slot group
      final resources = await searchResources(
        query: event.query,
        slotGroupName: state.selectedSlotGroup,
      );

      emit(state.copyWith(searchResults: resources, isSearching: false));
    } on AppException catch (e) {
      emit(
        state.copyWith(isSearching: false, searchError: e.userFriendlyMessage),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSearching: false,
          searchError: 'Search failed: ${e.toString()}',
        ),
      );
    }
  }
}
