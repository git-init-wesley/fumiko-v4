import 'package:flutter/foundation.dart';

class ChangeListener implements Listenable {
  final List<VoidCallback> _listeners = [];

  Future<void> onChange() async {
    if (_listeners.isNotEmpty) {
      for (VoidCallback listener in _listeners) {
        try {
          listener.call();
        } catch (_) {
          removeListener(listener);
        }
      }
    }
  }

  @override
  void addListener(VoidCallback listener) => _listeners.add(listener);

  @override
  void removeListener(VoidCallback listener) => _listeners.remove(listener);

  void disposeListeners() => _listeners.clear();
}
