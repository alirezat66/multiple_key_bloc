import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';

part 'resource_model.freezed.dart';
part 'resource_model.g.dart';

@freezed
abstract class ResourceModel with _$ResourceModel {
  const ResourceModel._();

  const factory ResourceModel({
    required String firstName,
    required String name,
    required String userId,
    required String photo,
    @Default([]) List<String> certificates,
  }) = _ResourceModel;

  // JSON serialization belongs here
  factory ResourceModel.fromJson(Map<String, dynamic> json) =>
      _$ResourceModelFromJson(json);

  // Mapper to entity
  ResourceEntity toEntity() => ResourceEntity(
    firstName: firstName,
    name: name,
    userId: userId,
    photo: photo,
    certificates: certificates,
  );
}
