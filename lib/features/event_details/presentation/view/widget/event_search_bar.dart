import 'package:flutter/material.dart';
import 'package:user_list/core/utils/debouncer.dart';

class EventSearchBar extends StatefulWidget {
  const EventSearchBar({
    super.key,
    required this.onSearchChanged,
  });

  final ValueChanged<String> onSearchChanged;

  @override
  State<EventSearchBar> createState() => _EventSearchBarState();
}

class _EventSearchBarState extends State<EventSearchBar>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late Debouncer _debouncer;

  // Animation controllers for the search bar cancel button
  late AnimationController _searchAnimationController;
  late Animation<double> _cancelButtonAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize debouncer for search
    _debouncer = Debouncer(delay: const Duration(milliseconds: 300));
    _searchController.addListener(_onSearchChanged);

    // Set up search animation
    _searchAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _cancelButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _searchAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Listen for focus changes to trigger the cancel button animation
    _searchFocusNode.addListener(() {
      if (_searchFocusNode.hasFocus) {
        _searchAnimationController.forward();
      } else if (_searchController.text.isEmpty) {
        _searchAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _debouncer.cancel();
    _searchAnimationController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _debouncer.run(() {
      widget.onSearchChanged(_searchController.text);
    });
  }

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
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Clear button
                  if (_searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
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
                  _searchController.clear();
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