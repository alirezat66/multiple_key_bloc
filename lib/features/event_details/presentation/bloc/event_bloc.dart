import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
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
    on<SearchEvent>(
      _onSearch,
      transformer: _debounceSearchEvents(const Duration(milliseconds: 300)),
    );
  }

  // Custom transformer that debounces per tab
  EventTransformer<T> _debounceSearchEvents<T extends EventEvent>(
    Duration duration,
  ) {
    return (events, mapper) {
      return events.switchMap((event) {
        // Apply debouncing only to SearchEvents
        if (event is SearchEvent) {
          return Stream.value(
            event,
          ).debounceTime(duration).flatMap((e) => mapper(e));
        } else {
          // Pass through other events immediately
          return mapper(event);
        }
      });
    };
  }

  void _onLoadEvent(LoadEventEvent event, Emitter<EventState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final eventData = await getEvent();
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

      // Initialize search for each slot group
      for (final slotGroup in eventData.slotGroups) {
        final tabId = 'tab_${slotGroup.slotGroupName}';
        add(SearchEvent(query: '', tabId: tabId));
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load event: ${e.toString()}',
        ),
      );
    }
  }

  void _onSelectSlotGroup(
    SelectSlotGroupEvent event,
    Emitter<EventState> emit,
  ) {
    emit(state.copyWith(selectedSlotGroup: event.slotGroupName));
  }

  void _onSearch(SearchEvent event, Emitter<EventState> emit) async {
    // Get current tab's search state or create a new one
    final currentTabState = state.getSearchStateForTab(event.tabId);

    // Start loading if needed
    if (!currentTabState.isLoading) {
      emit(
        state.updateTabSearchState(
          event.tabId,
          currentTabState.copyWith(isLoading: true, errorMessage: null),
        ),
      );
    }

    try {
      // Get slot group name from tab ID
      final slotGroupName =
          event.tabId.startsWith('tab_')
              ? event.tabId.substring(4)
              : state.selectedSlotGroup;

      // Perform search with the slot ID as filter
      final resources = await searchResources(
        query: event.query,
        slotGroupName: slotGroupName,
      );

      emit(
        state.updateTabSearchState(
          event.tabId,
          currentTabState.copyWith(isLoading: false, resources: resources),
        ),
      );
    } on AppException catch (e) {
      emit(
        state.updateTabSearchState(
          event.tabId,
          currentTabState.copyWith(
            isLoading: false,
            errorMessage: e.userFriendlyMessage,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.updateTabSearchState(
          event.tabId,
          currentTabState.copyWith(
            isLoading: false,
            errorMessage: 'Search failed: ${e.toString()}',
          ),
        ),
      );
    }
  }
}
