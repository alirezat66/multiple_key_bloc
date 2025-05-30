import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_event.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_state.dart';
import 'package:user_list/features/event_details/presentation/view/widget/event_detail_view.dart';
import 'package:user_list/features/event_details/presentation/view/widget/loading_widget.dart';


class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  EventDetailPageState createState() => EventDetailPageState();
}

class EventDetailPageState extends State<EventDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _slotGroupNames = [];

  @override
  void initState() {
    super.initState();
    // Load the event data
    context.read<EventBloc>().add(LoadEventEvent());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _initializeTabController(List<String> slotGroupNames) {
    if (_slotGroupNames != slotGroupNames) {
      _slotGroupNames = slotGroupNames;
      _tabController = TabController(
        length: _slotGroupNames.length,
        vsync: this,
      );

      // Add listener to update selected slot group when tab changes
      _tabController.addListener(() {
        if (!_tabController.indexIsChanging &&
            _tabController.index < _slotGroupNames.length) {
          final selectedSlotGroup = _slotGroupNames[_tabController.index];
          final currentState = context.read<EventBloc>().state;

          if (currentState.selectedSlotGroup != selectedSlotGroup) {
            // Select the new slot group (this will also trigger a search)
            context.read<EventBloc>().add(
              SelectSlotGroupEvent(selectedSlotGroup),
            );
          }
        }
      });
    }
  }

  void _onSearchChanged(String query) {
    context.read<EventBloc>().add(SearchEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: BlocBuilder<EventBloc, EventState>(
          buildWhen:
              (previous, current) =>
                  previous.event?.categoryName != current.event?.categoryName,
          builder: (context, state) {
            return state.event != null
                ? Text(
                  state.event!.categoryName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
                : const SizedBox();
          },
        ),
      ),
      body: BlocConsumer<EventBloc, EventState>(
        listenWhen:
            (previous, current) =>
                previous.event?.slotGroups.length !=
                current.event?.slotGroups.length,
        listener: (context, state) {
          if (state.event != null) {
            _initializeTabController(
              state.event!.slotGroups.map((e) => e.slotGroupName).toList(),
            );
          }
        },
        buildWhen:
            (previous, current) =>
                previous.isLoading != current.isLoading ||
                previous.errorMessage != current.errorMessage ||
                previous.event != current.event,
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingWidget();
          } else if (state.errorMessage != null) {
            return ErrorWidget(state.errorMessage!);
          } else if (state.event != null && _slotGroupNames.isNotEmpty) {
            return EventDetailView(
              state: state,
              tabController: _tabController,
              slotGroupNames: _slotGroupNames,
              onSearchChanged: _onSearchChanged,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
