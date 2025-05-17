import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';
import 'package:user_list/features/event_details/domain/repositories/event_repository.dart';

class SearchResources {
  final EventRepository repository;

  SearchResources(this.repository);

  Future<List<ResourceEntity>> call({
    required String query,
    required String slotGroupName,
  }) async {
    return await repository.searchResources(query, slotGroupName);
  }
}
