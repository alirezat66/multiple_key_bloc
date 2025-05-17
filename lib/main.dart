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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const <Widget>[
            Tab(text: "Tab 1"),
            Tab(text: "Tab 2"),
            Tab(text: "Tab 3"),
            Tab(text: "Tab 4"),
            Tab(text: "Tab  this is long5"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(child: Text("Content of Tab 1")),
          Center(child: Text("Content of Tab 2")),
          Center(child: Text("Content of Tab 3")),
          Center(child: Text("Content of Tab 4")),
          Center(child: Text("Content of Tab 5")),
        ],
      ),
    );
  }
}
