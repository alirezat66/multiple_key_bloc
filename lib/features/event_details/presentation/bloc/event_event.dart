import 'package:equatable/equatable.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load the initial event data
class LoadEventEvent extends EventEvent {}

/// Event to select a slot group (tab)
class SelectSlotGroupEvent extends EventEvent {
  final String slotGroupName;

  const SelectSlotGroupEvent(this.slotGroupName);

  @override
  List<Object?> get props => [slotGroupName];
}

/// Event to perform a search
class SearchEvent extends EventEvent {
  final String query;

  const SearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
