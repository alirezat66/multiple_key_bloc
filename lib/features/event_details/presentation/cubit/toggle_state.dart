class ToggleState {
  final Map<String, bool> toggledItems;
  final bool isSearchBarFocused;

  const ToggleState({
    this.toggledItems = const {},
    this.isSearchBarFocused = false,
  });

  ToggleState copyWith({
    Map<String, bool>? toggledItems,
    bool? isSearchBarFocused,
  }) {
    return ToggleState(
      toggledItems: toggledItems ?? this.toggledItems,
      isSearchBarFocused: isSearchBarFocused ?? this.isSearchBarFocused,
    );
  }
}