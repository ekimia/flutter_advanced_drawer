part of '../flutter_advanced_drawer.dart';

/// Advanced Drawer Controller that manage drawer state.
class AdvancedDrawerController extends ValueNotifier<AdvancedDrawerValue> {
  /// Creates controller with initial drawer state. (Hidden by default)
  AdvancedDrawerController([AdvancedDrawerValue? value])
      : super(value ?? AdvancedDrawerValue.hidden());

  /// Shows drawer.
  void showDrawer() {
    value = AdvancedDrawerValue.visible();
    notifyListeners();
  }

  /// Hides drawer.
  void hideDrawer({VoidCallback? completion}) {
    value = AdvancedDrawerValue.hidden();
    notifyListeners();
    // Subpar, but for now let's some time by delaying the callback by the animation duration
    // so the consumer knows when the drawer is actually hidden.
    Future.delayed(const Duration(milliseconds: 250), () {
      completion?.call();
    });
  }

  /// Toggles drawer.
  void toggleDrawer() {
    if (value.visible) {
      return hideDrawer();
    }

    return showDrawer();
  }
}
