import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/features/event_details/data/models/resource_model.dart';
import 'package:user_list/features/event_details/domain/entities/slot_group_entity.dart';

part 'slot_group_model.freezed.dart';
part 'slot_group_model.g.dart';

@freezed
abstract class SlotGroupModel with _$SlotGroupModel {
  const SlotGroupModel._();

  const factory SlotGroupModel({
    required String slotGroupName,
    required List<ResourceModel> resources,

    @Default([]) List<String> certificates,
  }) = _SlotGroupModel;

  // JSON serialization belongs here
  factory SlotGroupModel.fromJson(Map<String, dynamic> json) =>
      _$SlotGroupModelFromJson(json);
  
  
  SlotGroupEntity toEntity() => SlotGroupEntity(
    slotGroupName: slotGroupName,
    resources: resources.map((item) => item.toEntity()).toList(),
  );
}
