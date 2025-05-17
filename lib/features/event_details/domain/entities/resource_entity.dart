import 'package:freezed_annotation/freezed_annotation.dart';
part 'resource_entity.freezed.dart';

@freezed
abstract class ResourceEntity with _$ResourceEntity {
  const factory ResourceEntity({
    required String firstName,
    required String name,
    required String userId,
    required String photo,
    required List<String> certificates,
  }) = _ResourceEntity;

  // NO fromJson here!
}
