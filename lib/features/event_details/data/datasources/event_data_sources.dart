import 'package:user_list/features/event_details/data/models/event_model.dart';
import 'package:user_list/features/event_details/data/models/resource_model.dart';

abstract class EventDataSource {
  Future<EventModel> getEvent();
  Future<List<ResourceModel>> searchResources(
    String query,
    String slotGroupName,
  );
}
