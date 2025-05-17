import 'package:user_list/features/event_details/domain/entities/event_entity.dart';
import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';

abstract class EventRepository {
  Future<EventEntity> getEvent();
  Future<List<ResourceEntity>> searchResources(
    String query,
    String slotGroupName,
  );
}
