// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventModel {

 String get categoryName; String get eventName; List<SlotGroupModel> get slotGroups;
/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventModelCopyWith<EventModel> get copyWith => _$EventModelCopyWithImpl<EventModel>(this as EventModel, _$identity);

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventModel&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&const DeepCollectionEquality().equals(other.slotGroups, slotGroups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryName,eventName,const DeepCollectionEquality().hash(slotGroups));

@override
String toString() {
  return 'EventModel(categoryName: $categoryName, eventName: $eventName, slotGroups: $slotGroups)';
}


}

/// @nodoc
abstract mixin class $EventModelCopyWith<$Res>  {
  factory $EventModelCopyWith(EventModel value, $Res Function(EventModel) _then) = _$EventModelCopyWithImpl;
@useResult
$Res call({
 String categoryName, String eventName, List<SlotGroupModel> slotGroups
});




}
/// @nodoc
class _$EventModelCopyWithImpl<$Res>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._self, this._then);

  final EventModel _self;
  final $Res Function(EventModel) _then;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryName = null,Object? eventName = null,Object? slotGroups = null,}) {
  return _then(_self.copyWith(
categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,slotGroups: null == slotGroups ? _self.slotGroups : slotGroups // ignore: cast_nullable_to_non_nullable
as List<SlotGroupModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EventModel extends EventModel {
  const _EventModel({required this.categoryName, required this.eventName, required final  List<SlotGroupModel> slotGroups}): _slotGroups = slotGroups,super._();
  factory _EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);

@override final  String categoryName;
@override final  String eventName;
 final  List<SlotGroupModel> _slotGroups;
@override List<SlotGroupModel> get slotGroups {
  if (_slotGroups is EqualUnmodifiableListView) return _slotGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slotGroups);
}


/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventModelCopyWith<_EventModel> get copyWith => __$EventModelCopyWithImpl<_EventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventModel&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&const DeepCollectionEquality().equals(other._slotGroups, _slotGroups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryName,eventName,const DeepCollectionEquality().hash(_slotGroups));

@override
String toString() {
  return 'EventModel(categoryName: $categoryName, eventName: $eventName, slotGroups: $slotGroups)';
}


}

/// @nodoc
abstract mixin class _$EventModelCopyWith<$Res> implements $EventModelCopyWith<$Res> {
  factory _$EventModelCopyWith(_EventModel value, $Res Function(_EventModel) _then) = __$EventModelCopyWithImpl;
@override @useResult
$Res call({
 String categoryName, String eventName, List<SlotGroupModel> slotGroups
});




}
/// @nodoc
class __$EventModelCopyWithImpl<$Res>
    implements _$EventModelCopyWith<$Res> {
  __$EventModelCopyWithImpl(this._self, this._then);

  final _EventModel _self;
  final $Res Function(_EventModel) _then;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryName = null,Object? eventName = null,Object? slotGroups = null,}) {
  return _then(_EventModel(
categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,slotGroups: null == slotGroups ? _self._slotGroups : slotGroups // ignore: cast_nullable_to_non_nullable
as List<SlotGroupModel>,
  ));
}


}

// dart format on
