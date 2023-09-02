mixin ChangeListener<T> {
  final List<Function(T?)> _listeners = [];

  Future<void> onChange(T obj) async {
    if (_listeners.isNotEmpty) {
      for (Function(T?) listener in _listeners) {
        try {
          listener.call(obj);
        } catch (_) {
          removeListener(listener);
        }
      }
    }
  }

  void addListener(Function(T?) listener) => _listeners.add(listener);

  void removeListener(Function(T?) listener) => _listeners.remove(listener);

  void disposeListeners() => _listeners.clear();
}
