import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';
part 'slot_group_entity.freezed.dart';

@freezed
abstract class SlotGroupEntity with _$SlotGroupEntity {
  const factory SlotGroupEntity({
    required String slotGroupName,
    required List<ResourceEntity> resources,
  }) = _SlotGroupEntity;
}
