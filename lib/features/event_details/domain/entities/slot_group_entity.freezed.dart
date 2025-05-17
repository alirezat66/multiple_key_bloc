// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot_group_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SlotGroupEntity {

 String get slotGroupName; List<ResourceEntity> get resources;
/// Create a copy of SlotGroupEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotGroupEntityCopyWith<SlotGroupEntity> get copyWith => _$SlotGroupEntityCopyWithImpl<SlotGroupEntity>(this as SlotGroupEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotGroupEntity&&(identical(other.slotGroupName, slotGroupName) || other.slotGroupName == slotGroupName)&&const DeepCollectionEquality().equals(other.resources, resources));
}


@override
int get hashCode => Object.hash(runtimeType,slotGroupName,const DeepCollectionEquality().hash(resources));

@override
String toString() {
  return 'SlotGroupEntity(slotGroupName: $slotGroupName, resources: $resources)';
}


}

/// @nodoc
abstract mixin class $SlotGroupEntityCopyWith<$Res>  {
  factory $SlotGroupEntityCopyWith(SlotGroupEntity value, $Res Function(SlotGroupEntity) _then) = _$SlotGroupEntityCopyWithImpl;
@useResult
$Res call({
 String slotGroupName, List<ResourceEntity> resources
});




}
/// @nodoc
class _$SlotGroupEntityCopyWithImpl<$Res>
    implements $SlotGroupEntityCopyWith<$Res> {
  _$SlotGroupEntityCopyWithImpl(this._self, this._then);

  final SlotGroupEntity _self;
  final $Res Function(SlotGroupEntity) _then;

/// Create a copy of SlotGroupEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slotGroupName = null,Object? resources = null,}) {
  return _then(_self.copyWith(
slotGroupName: null == slotGroupName ? _self.slotGroupName : slotGroupName // ignore: cast_nullable_to_non_nullable
as String,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<ResourceEntity>,
  ));
}

}


/// @nodoc


class _SlotGroupEntity implements SlotGroupEntity {
  const _SlotGroupEntity({required this.slotGroupName, required final  List<ResourceEntity> resources}): _resources = resources;
  

@override final  String slotGroupName;
 final  List<ResourceEntity> _resources;
@override List<ResourceEntity> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}


/// Create a copy of SlotGroupEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotGroupEntityCopyWith<_SlotGroupEntity> get copyWith => __$SlotGroupEntityCopyWithImpl<_SlotGroupEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlotGroupEntity&&(identical(other.slotGroupName, slotGroupName) || other.slotGroupName == slotGroupName)&&const DeepCollectionEquality().equals(other._resources, _resources));
}


@override
int get hashCode => Object.hash(runtimeType,slotGroupName,const DeepCollectionEquality().hash(_resources));

@override
String toString() {
  return 'SlotGroupEntity(slotGroupName: $slotGroupName, resources: $resources)';
}


}

/// @nodoc
abstract mixin class _$SlotGroupEntityCopyWith<$Res> implements $SlotGroupEntityCopyWith<$Res> {
  factory _$SlotGroupEntityCopyWith(_SlotGroupEntity value, $Res Function(_SlotGroupEntity) _then) = __$SlotGroupEntityCopyWithImpl;
@override @useResult
$Res call({
 String slotGroupName, List<ResourceEntity> resources
});




}
/// @nodoc
class __$SlotGroupEntityCopyWithImpl<$Res>
    implements _$SlotGroupEntityCopyWith<$Res> {
  __$SlotGroupEntityCopyWithImpl(this._self, this._then);

  final _SlotGroupEntity _self;
  final $Res Function(_SlotGroupEntity) _then;

/// Create a copy of SlotGroupEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slotGroupName = null,Object? resources = null,}) {
  return _then(_SlotGroupEntity(
slotGroupName: null == slotGroupName ? _self.slotGroupName : slotGroupName // ignore: cast_nullable_to_non_nullable
as String,resources: null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<ResourceEntity>,
  ));
}


}

// dart format on
