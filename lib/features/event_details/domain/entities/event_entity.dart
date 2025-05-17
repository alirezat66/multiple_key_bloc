import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/features/event_details/domain/entities/slot_group_entity.dart';
part 'event_entity.freezed.dart';

@freezed
abstract class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String categoryName,
    required String eventName,
    required List<SlotGroupEntity> slotGroups,
  }) = _EventEntity;

  // NO fromJson here!
}
