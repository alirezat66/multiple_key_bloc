import 'package:equatable/equatable.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object?> get props => [];
}

class LoadEventEvent extends EventEvent {}

class SelectSlotGroupEvent extends EventEvent {
  final String slotGroupName;

  const SelectSlotGroupEvent(this.slotGroupName);

  @override
  List<Object?> get props => [slotGroupName];
}

class SearchEvent extends EventEvent {
  final String query;
  final String tabId;

  const SearchEvent({required this.query, required this.tabId});

  @override
  List<Object?> get props => [query, tabId];
}
