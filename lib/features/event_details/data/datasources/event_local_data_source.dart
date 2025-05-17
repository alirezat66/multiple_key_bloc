import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:user_list/core/error/exceptions.dart';
import 'package:user_list/features/event_details/data/datasources/event_data_sources.dart';
import 'package:user_list/features/event_details/data/models/event_model.dart';
import 'package:user_list/features/event_details/data/models/resource_model.dart';

class EventLocalDataSource implements EventDataSource {
  @override
  Future<EventModel> getEvent() async {
    try {
      // In a real app, we would load from a data source. Here we'll use the JSON file
      final String jsonString = await rootBundle.loadString(
        'assets/data_Example.json',
      );
      final jsonMap = json.decode(jsonString);
      return EventModel.fromJson(jsonMap);
    } catch (e) {
      throw const AppException.cacheError('Failed to load event data');
    }
  }

  @override
  Future<List<ResourceModel>> searchResources(
    String query,
    String slotGroupName,
  ) async {
    try {
      final event = await getEvent();
      final slotGroup = event.slotGroups.firstWhere(
        (group) => group.slotGroupName == slotGroupName,
        orElse: () => throw const AppException.notFound('Slot group'),
      );

      if (query.isEmpty) {
        return slotGroup.resources;
      }

      // Filter resources by the query
      return (slotGroup.resources).where((resource) {
        final fullName = '${resource.firstName} ${resource.name}'.toLowerCase();
        final userId = resource.userId.toLowerCase();
        final searchQuery = query.toLowerCase();

        return fullName.contains(searchQuery) || userId.contains(searchQuery);
      }).toList();
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException.unexpected(
        'Failed to search resources: ${e.toString()}',
      );
    }
  }
}
