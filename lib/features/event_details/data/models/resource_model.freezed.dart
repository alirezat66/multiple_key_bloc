// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResourceModel {

 String get firstName; String get name; String get userId; String get photo; List<String> get certificates;
/// Create a copy of ResourceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<ResourceModel> get copyWith => _$ResourceModelCopyWithImpl<ResourceModel>(this as ResourceModel, _$identity);

  /// Serializes this ResourceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.photo, photo) || other.photo == photo)&&const DeepCollectionEquality().equals(other.certificates, certificates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,name,userId,photo,const DeepCollectionEquality().hash(certificates));

@override
String toString() {
  return 'ResourceModel(firstName: $firstName, name: $name, userId: $userId, photo: $photo, certificates: $certificates)';
}


}

/// @nodoc
abstract mixin class $ResourceModelCopyWith<$Res>  {
  factory $ResourceModelCopyWith(ResourceModel value, $Res Function(ResourceModel) _then) = _$ResourceModelCopyWithImpl;
@useResult
$Res call({
 String firstName, String name, String userId, String photo, List<String> certificates
});




}
/// @nodoc
class _$ResourceModelCopyWithImpl<$Res>
    implements $ResourceModelCopyWith<$Res> {
  _$ResourceModelCopyWithImpl(this._self, this._then);

  final ResourceModel _self;
  final $Res Function(ResourceModel) _then;

/// Create a copy of ResourceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? name = null,Object? userId = null,Object? photo = null,Object? certificates = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,certificates: null == certificates ? _self.certificates : certificates // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResourceModel extends ResourceModel {
  const _ResourceModel({required this.firstName, required this.name, required this.userId, required this.photo, final  List<String> certificates = const []}): _certificates = certificates,super._();
  factory _ResourceModel.fromJson(Map<String, dynamic> json) => _$ResourceModelFromJson(json);

@override final  String firstName;
@override final  String name;
@override final  String userId;
@override final  String photo;
 final  List<String> _certificates;
@override@JsonKey() List<String> get certificates {
  if (_certificates is EqualUnmodifiableListView) return _certificates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_certificates);
}


/// Create a copy of ResourceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceModelCopyWith<_ResourceModel> get copyWith => __$ResourceModelCopyWithImpl<_ResourceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.photo, photo) || other.photo == photo)&&const DeepCollectionEquality().equals(other._certificates, _certificates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,name,userId,photo,const DeepCollectionEquality().hash(_certificates));

@override
String toString() {
  return 'ResourceModel(firstName: $firstName, name: $name, userId: $userId, photo: $photo, certificates: $certificates)';
}


}

/// @nodoc
abstract mixin class _$ResourceModelCopyWith<$Res> implements $ResourceModelCopyWith<$Res> {
  factory _$ResourceModelCopyWith(_ResourceModel value, $Res Function(_ResourceModel) _then) = __$ResourceModelCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String name, String userId, String photo, List<String> certificates
});




}
/// @nodoc
class __$ResourceModelCopyWithImpl<$Res>
    implements _$ResourceModelCopyWith<$Res> {
  __$ResourceModelCopyWithImpl(this._self, this._then);

  final _ResourceModel _self;
  final $Res Function(_ResourceModel) _then;

/// Create a copy of ResourceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? name = null,Object? userId = null,Object? photo = null,Object? certificates = null,}) {
  return _then(_ResourceModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,certificates: null == certificates ? _self._certificates : certificates // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
