// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SlotGroupModel {

 String get slotGroupName; List<ResourceModel> get resources; List<String> get certificates;
/// Create a copy of SlotGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotGroupModelCopyWith<SlotGroupModel> get copyWith => _$SlotGroupModelCopyWithImpl<SlotGroupModel>(this as SlotGroupModel, _$identity);

  /// Serializes this SlotGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotGroupModel&&(identical(other.slotGroupName, slotGroupName) || other.slotGroupName == slotGroupName)&&const DeepCollectionEquality().equals(other.resources, resources)&&const DeepCollectionEquality().equals(other.certificates, certificates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slotGroupName,const DeepCollectionEquality().hash(resources),const DeepCollectionEquality().hash(certificates));

@override
String toString() {
  return 'SlotGroupModel(slotGroupName: $slotGroupName, resources: $resources, certificates: $certificates)';
}


}

/// @nodoc
abstract mixin class $SlotGroupModelCopyWith<$Res>  {
  factory $SlotGroupModelCopyWith(SlotGroupModel value, $Res Function(SlotGroupModel) _then) = _$SlotGroupModelCopyWithImpl;
@useResult
$Res call({
 String slotGroupName, List<ResourceModel> resources, List<String> certificates
});




}
/// @nodoc
class _$SlotGroupModelCopyWithImpl<$Res>
    implements $SlotGroupModelCopyWith<$Res> {
  _$SlotGroupModelCopyWithImpl(this._self, this._then);

  final SlotGroupModel _self;
  final $Res Function(SlotGroupModel) _then;

/// Create a copy of SlotGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slotGroupName = null,Object? resources = null,Object? certificates = null,}) {
  return _then(_self.copyWith(
slotGroupName: null == slotGroupName ? _self.slotGroupName : slotGroupName // ignore: cast_nullable_to_non_nullable
as String,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>,certificates: null == certificates ? _self.certificates : certificates // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SlotGroupModel extends SlotGroupModel {
  const _SlotGroupModel({required this.slotGroupName, required final  List<ResourceModel> resources, final  List<String> certificates = const []}): _resources = resources,_certificates = certificates,super._();
  factory _SlotGroupModel.fromJson(Map<String, dynamic> json) => _$SlotGroupModelFromJson(json);

@override final  String slotGroupName;
 final  List<ResourceModel> _resources;
@override List<ResourceModel> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}

 final  List<String> _certificates;
@override@JsonKey() List<String> get certificates {
  if (_certificates is EqualUnmodifiableListView) return _certificates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_certificates);
}


/// Create a copy of SlotGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotGroupModelCopyWith<_SlotGroupModel> get copyWith => __$SlotGroupModelCopyWithImpl<_SlotGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlotGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlotGroupModel&&(identical(other.slotGroupName, slotGroupName) || other.slotGroupName == slotGroupName)&&const DeepCollectionEquality().equals(other._resources, _resources)&&const DeepCollectionEquality().equals(other._certificates, _certificates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slotGroupName,const DeepCollectionEquality().hash(_resources),const DeepCollectionEquality().hash(_certificates));

@override
String toString() {
  return 'SlotGroupModel(slotGroupName: $slotGroupName, resources: $resources, certificates: $certificates)';
}


}

/// @nodoc
abstract mixin class _$SlotGroupModelCopyWith<$Res> implements $SlotGroupModelCopyWith<$Res> {
  factory _$SlotGroupModelCopyWith(_SlotGroupModel value, $Res Function(_SlotGroupModel) _then) = __$SlotGroupModelCopyWithImpl;
@override @useResult
$Res call({
 String slotGroupName, List<ResourceModel> resources, List<String> certificates
});




}
/// @nodoc
class __$SlotGroupModelCopyWithImpl<$Res>
    implements _$SlotGroupModelCopyWith<$Res> {
  __$SlotGroupModelCopyWithImpl(this._self, this._then);

  final _SlotGroupModel _self;
  final $Res Function(_SlotGroupModel) _then;

/// Create a copy of SlotGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slotGroupName = null,Object? resources = null,Object? certificates = null,}) {
  return _then(_SlotGroupModel(
slotGroupName: null == slotGroupName ? _self.slotGroupName : slotGroupName // ignore: cast_nullable_to_non_nullable
as String,resources: null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>,certificates: null == certificates ? _self._certificates : certificates // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
