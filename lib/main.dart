import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/core/di/service_locator.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_cubit.dart';
import 'package:user_list/features/event_details/presentation/view/page/event_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.initEventDetailsFeature();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventBloc>(create: (_) => locator<EventBloc>()),
        BlocProvider<ToggleCubit>(create: (_) => locator<ToggleCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            surface: Colors.white,
            secondary: Color(0xFF1B4278),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w600, // SemiBold
            ),
          ),
          tabBarTheme: const TabBarTheme(
            unselectedLabelColor: Color(0xFFA8A7A8),
            labelColor: Colors.black,
            unselectedLabelStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.normal, // Regular
            ),
            labelStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w600, // SemiBold
            ),
            indicatorColor: Colors.black,
          ),
        ),
        home: const EventDetailPage(),
      ),
    );
  }
}
