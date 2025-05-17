import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/features/event_details/presentation/cubit/toggle_state.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(const ToggleState());

  void toggleItem(String itemId) {
    final currentToggledItems = Map<String, bool>.from(state.toggledItems);
    final isToggled = currentToggledItems[itemId] ?? false;
    currentToggledItems[itemId] = !isToggled;
    emit(state.copyWith(toggledItems: currentToggledItems));
  }

  void setSearchBarFocus(bool isFocused) {
    emit(state.copyWith(isSearchBarFocused: isFocused));
  }

  void resetToggledItems() {
    emit(state.copyWith(toggledItems: {}));
  }
}