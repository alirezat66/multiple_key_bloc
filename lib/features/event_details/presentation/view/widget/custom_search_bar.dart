/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_bloc.dart';
import 'package:user_list/features/event_details/presentation/bloc/event_event.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_cubit.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_state.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final VoidCallback onCancelPressed;
  const CustomSearchBar({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Search field
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
                      controller: searchController,
                      focusNode: searchFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Clear button
                  if (searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        searchController.clear();
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

          // Cancel button with animation
          SizeTransition(
            sizeFactor: _cancelButtonAnimation,
            axis: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: TextButton(
                onPressed: () {
                  searchController.clear();
                  FocusScope.of(context).unfocus();
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
    );
  }
}
 */