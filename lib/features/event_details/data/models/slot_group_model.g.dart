// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SlotGroupModel _$SlotGroupModelFromJson(Map<String, dynamic> json) =>
    _SlotGroupModel(
      slotGroupName: json['slotGroupName'] as String,
      resources:
          (json['resources'] as List<dynamic>)
              .map((e) => ResourceModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      certificates:
          (json['certificates'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SlotGroupModelToJson(_SlotGroupModel instance) =>
    <String, dynamic>{
      'slotGroupName': instance.slotGroupName,
      'resources': instance.resources,
      'certificates': instance.certificates,
    };
