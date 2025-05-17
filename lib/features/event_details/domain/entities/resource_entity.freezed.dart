// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResourceEntity {

 String get firstName; String get name; String get userId; String get photo; List<String> get certificates;
/// Create a copy of ResourceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceEntityCopyWith<ResourceEntity> get copyWith => _$ResourceEntityCopyWithImpl<ResourceEntity>(this as ResourceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceEntity&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.photo, photo) || other.photo == photo)&&const DeepCollectionEquality().equals(other.certificates, certificates));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,name,userId,photo,const DeepCollectionEquality().hash(certificates));

@override
String toString() {
  return 'ResourceEntity(firstName: $firstName, name: $name, userId: $userId, photo: $photo, certificates: $certificates)';
}


}

/// @nodoc
abstract mixin class $ResourceEntityCopyWith<$Res>  {
  factory $ResourceEntityCopyWith(ResourceEntity value, $Res Function(ResourceEntity) _then) = _$ResourceEntityCopyWithImpl;
@useResult
$Res call({
 String firstName, String name, String userId, String photo, List<String> certificates
});




}
/// @nodoc
class _$ResourceEntityCopyWithImpl<$Res>
    implements $ResourceEntityCopyWith<$Res> {
  _$ResourceEntityCopyWithImpl(this._self, this._then);

  final ResourceEntity _self;
  final $Res Function(ResourceEntity) _then;

/// Create a copy of ResourceEntity
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


class _ResourceEntity implements ResourceEntity {
  const _ResourceEntity({required this.firstName, required this.name, required this.userId, required this.photo, required final  List<String> certificates}): _certificates = certificates;
  

@override final  String firstName;
@override final  String name;
@override final  String userId;
@override final  String photo;
 final  List<String> _certificates;
@override List<String> get certificates {
  if (_certificates is EqualUnmodifiableListView) return _certificates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_certificates);
}


/// Create a copy of ResourceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceEntityCopyWith<_ResourceEntity> get copyWith => __$ResourceEntityCopyWithImpl<_ResourceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceEntity&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.photo, photo) || other.photo == photo)&&const DeepCollectionEquality().equals(other._certificates, _certificates));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,name,userId,photo,const DeepCollectionEquality().hash(_certificates));

@override
String toString() {
  return 'ResourceEntity(firstName: $firstName, name: $name, userId: $userId, photo: $photo, certificates: $certificates)';
}


}

/// @nodoc
abstract mixin class _$ResourceEntityCopyWith<$Res> implements $ResourceEntityCopyWith<$Res> {
  factory _$ResourceEntityCopyWith(_ResourceEntity value, $Res Function(_ResourceEntity) _then) = __$ResourceEntityCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String name, String userId, String photo, List<String> certificates
});




}
/// @nodoc
class __$ResourceEntityCopyWithImpl<$Res>
    implements _$ResourceEntityCopyWith<$Res> {
  __$ResourceEntityCopyWithImpl(this._self, this._then);

  final _ResourceEntity _self;
  final $Res Function(_ResourceEntity) _then;

/// Create a copy of ResourceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? name = null,Object? userId = null,Object? photo = null,Object? certificates = null,}) {
  return _then(_ResourceEntity(
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
