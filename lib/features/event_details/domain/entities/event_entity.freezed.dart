// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventEntity {

 String get categoryName; String get eventName; List<SlotGroupEntity> get slotGroups;
/// Create a copy of EventEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventEntityCopyWith<EventEntity> get copyWith => _$EventEntityCopyWithImpl<EventEntity>(this as EventEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventEntity&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&const DeepCollectionEquality().equals(other.slotGroups, slotGroups));
}


@override
int get hashCode => Object.hash(runtimeType,categoryName,eventName,const DeepCollectionEquality().hash(slotGroups));

@override
String toString() {
  return 'EventEntity(categoryName: $categoryName, eventName: $eventName, slotGroups: $slotGroups)';
}


}

/// @nodoc
abstract mixin class $EventEntityCopyWith<$Res>  {
  factory $EventEntityCopyWith(EventEntity value, $Res Function(EventEntity) _then) = _$EventEntityCopyWithImpl;
@useResult
$Res call({
 String categoryName, String eventName, List<SlotGroupEntity> slotGroups
});




}
/// @nodoc
class _$EventEntityCopyWithImpl<$Res>
    implements $EventEntityCopyWith<$Res> {
  _$EventEntityCopyWithImpl(this._self, this._then);

  final EventEntity _self;
  final $Res Function(EventEntity) _then;

/// Create a copy of EventEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryName = null,Object? eventName = null,Object? slotGroups = null,}) {
  return _then(_self.copyWith(
categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,slotGroups: null == slotGroups ? _self.slotGroups : slotGroups // ignore: cast_nullable_to_non_nullable
as List<SlotGroupEntity>,
  ));
}

}


/// @nodoc


class _EventEntity implements EventEntity {
  const _EventEntity({required this.categoryName, required this.eventName, required final  List<SlotGroupEntity> slotGroups}): _slotGroups = slotGroups;
  

@override final  String categoryName;
@override final  String eventName;
 final  List<SlotGroupEntity> _slotGroups;
@override List<SlotGroupEntity> get slotGroups {
  if (_slotGroups is EqualUnmodifiableListView) return _slotGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slotGroups);
}


/// Create a copy of EventEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventEntityCopyWith<_EventEntity> get copyWith => __$EventEntityCopyWithImpl<_EventEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventEntity&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&const DeepCollectionEquality().equals(other._slotGroups, _slotGroups));
}


@override
int get hashCode => Object.hash(runtimeType,categoryName,eventName,const DeepCollectionEquality().hash(_slotGroups));

@override
String toString() {
  return 'EventEntity(categoryName: $categoryName, eventName: $eventName, slotGroups: $slotGroups)';
}


}

/// @nodoc
abstract mixin class _$EventEntityCopyWith<$Res> implements $EventEntityCopyWith<$Res> {
  factory _$EventEntityCopyWith(_EventEntity value, $Res Function(_EventEntity) _then) = __$EventEntityCopyWithImpl;
@override @useResult
$Res call({
 String categoryName, String eventName, List<SlotGroupEntity> slotGroups
});




}
/// @nodoc
class __$EventEntityCopyWithImpl<$Res>
    implements _$EventEntityCopyWith<$Res> {
  __$EventEntityCopyWithImpl(this._self, this._then);

  final _EventEntity _self;
  final $Res Function(_EventEntity) _then;

/// Create a copy of EventEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryName = null,Object? eventName = null,Object? slotGroups = null,}) {
  return _then(_EventEntity(
categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,slotGroups: null == slotGroups ? _self._slotGroups : slotGroups // ignore: cast_nullable_to_non_nullable
as List<SlotGroupEntity>,
  ));
}


}

// dart format on
