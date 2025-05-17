// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventModel _$EventModelFromJson(Map<String, dynamic> json) => _EventModel(
  categoryName: json['categoryName'] as String,
  eventName: json['eventName'] as String,
  slotGroups:
      (json['slotGroups'] as List<dynamic>)
          .map((e) => SlotGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$EventModelToJson(_EventModel instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'eventName': instance.eventName,
      'slotGroups': instance.slotGroups,
    };
