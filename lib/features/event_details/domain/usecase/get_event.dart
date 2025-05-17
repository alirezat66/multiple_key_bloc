import 'package:user_list/features/event_details/domain/entities/event_entity.dart';
import 'package:user_list/features/event_details/domain/repositories/event_repository.dart';

class GetEvent {
  final EventRepository repository;

  GetEvent(this.repository);

  Future<EventEntity> call() async {
    return await repository.getEvent();
  }
}
