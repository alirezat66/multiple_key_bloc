import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/features/event_details/data/models/slot_group_model.dart';
import 'package:user_list/features/event_details/domain/entities/event_entity.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
abstract class EventModel with _$EventModel {
  const EventModel._();

  const factory EventModel({
    required String categoryName,
    required String eventName,
    required List<SlotGroupModel> slotGroups,
  }) = _EventModel;

  // JSON serialization belongs here
  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  // Mapper to entity
  EventEntity toEntity() => EventEntity(
    categoryName: categoryName,
    eventName: eventName,
    slotGroups: slotGroups.map((item) => item.toEntity()).toList(),
  );
}
