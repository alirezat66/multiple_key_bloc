import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_event.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_cubit.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_state.dart';

class CustomSearchBar extends StatefulWidget {
  final String tabId;
  final TextEditingController controller;

  const CustomSearchBar({
    super.key,
    required this.tabId,
    required this.controller,
  });

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _cancelButtonAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _cancelButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    widget.controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<EventBloc>().add(
      SearchEvent(query: widget.controller.text, tabId: widget.tabId),
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onSearchChanged);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ToggleCubit, ToggleState>(
      listenWhen:
          (previous, current) =>
              previous.isSearchBarFocused != current.isSearchBarFocused,
      listener: (context, state) {
        if (state.isSearchBarFocused) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[600]),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        controller: widget.controller,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                        onTap: () {
                          context.read<ToggleCubit>().setSearchBarFocus(true);
                        },
                      ),
                    ),
                    // Clear button
                    if (widget.controller.text.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          widget.controller.clear();
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.grey[600],
                          size: 20,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _cancelButtonAnimation,
              axis: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: TextButton(
                  onPressed: () {
                    widget.controller.clear();
                    FocusScope.of(context).unfocus();
                    context.read<ToggleCubit>().setSearchBarFocus(false);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
