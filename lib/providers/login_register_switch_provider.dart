import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRgisterSwitchProvider extends Notifier<bool> {
  @override
  bool build() {
    return true; // true for login, false for register
  }

  void toggle() {
    state = !state;
  }
}

final loginRegisterSwitchProvider =
    NotifierProvider<LoginRgisterSwitchProvider, bool>(
        () => LoginRgisterSwitchProvider());