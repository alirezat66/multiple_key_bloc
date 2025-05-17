import 'package:user_list/core/error/exceptions.dart';
import 'package:user_list/features/event_details/data/datasources/event_data_sources.dart';
import 'package:user_list/features/event_details/domain/entities/event_entity.dart';
import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';
import 'package:user_list/features/event_details/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDataSource localDataSource;

  EventRepositoryImpl({required this.localDataSource});

  @override
  Future<EventEntity> getEvent() async {
    try {
      return (await localDataSource.getEvent()).toEntity();
    } on AppException {
      rethrow; // Pass the AppException up the chain
    } catch (e) {
      throw AppException.unexpected('Unexpected error: ${e.toString()}');
    }
  }

  @override
  Future<List<ResourceEntity>> searchResources(
    String query,
    String slotGroupName,
  ) async {
    try {
      return (await localDataSource.searchResources(
        query,
        slotGroupName,
      )).map((model) => model.toEntity()).toList();
    } on AppException {
      rethrow; // Pass the AppException up the chain
    } catch (e) {
      throw AppException.unexpected('Unexpected error: ${e.toString()}');
    }
  }
}
