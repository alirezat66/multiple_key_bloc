import 'package:get_it/get_it.dart';
import 'package:user_list/features/event_details/data/datasources/event_data_sources.dart';
import 'package:user_list/features/event_details/data/datasources/event_local_data_source.dart';
import 'package:user_list/features/event_details/data/repository/event_repository_impl.dart';
import 'package:user_list/features/event_details/domain/repositories/event_repository.dart';
import 'package:user_list/features/event_details/domain/usecase/get_event.dart';
import 'package:user_list/features/event_details/domain/usecase/search_resources.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_cubit.dart';

final locator = GetIt.instance;

class ServiceLocator {
  static Future<void> initEventDetailsFeature() async {
    // Cubits/BLoCs
    locator.registerFactory(() => EventBloc(getEvent: locator(), searchResources: locator()));
    locator.registerFactory(() => ToggleCubit());

    // Use cases
    locator.registerLazySingleton(() => GetEvent(locator()));
    locator.registerLazySingleton(() => SearchResources(locator()));

    // Repository
    locator.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(localDataSource: locator()),
    );

    // Data sources
    locator.registerLazySingleton<EventDataSource>(
      () => EventLocalDataSource(),
    );
  }
}
