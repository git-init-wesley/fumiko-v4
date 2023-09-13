part of core_user;

class CoreUserPresences with ChangeListener {
  CoreUserPresences._();

  static final CoreUserPresences _instance = CoreUserPresences._();

  static CoreUserPresences get instance => _instance;

  List<EntityUserPresence> _onlineUsers = [];

  List<EntityUserPresence> get onlineUsers => _onlineUsers;

  set _setOnlineUsers(List<EntityUserPresence> value) => _onlineUsers = value;

  StreamController? _onlineUsersStreamController;
  StreamSubscription? _onlineUsersStreamSubscription;

  StreamController? _currentUserStreamController;
  StreamSubscription? _currentUserStreamSubscription;

  Future<void> _observeOnlineUsers(_) async {
    try {
      DataSnapshot snapshot =
          await FirebaseDatabase.instance.ref().child('presences').orderByChild('lastOnline').startAt(DateTime.now().millisecondsSinceEpoch - const Duration(minutes: 5).inMilliseconds).get();
      _setOnlineUsers = [];
      if (snapshot.exists) {
        _setOnlineUsers = (snapshot.value as Map)
            .entries
            .map((entry) => EntityUserPresence.fromJson(entry.key, jsonDecode(jsonEncode((entry.value)))))
            .where((e) => e.isOnline && DateTime.now().millisecondsSinceEpoch - e.lastOnline <= const Duration(minutes: 5).inMilliseconds)
            .toList();
      }
    } catch (error, stacktrace) {
      if (!kReleaseMode) {
        developer.log(error.toString(), time: DateTime.now(), stackTrace: stacktrace);
      }
      _setOnlineUsers = [];
    } finally {
      onChange(null);
    }
  }

  Future<void> observeOnlineUsers() async {
    _observeOnlineUsers(null);
    if (_onlineUsersStreamController == null) {
      _onlineUsersStreamController = StreamController();
      _onlineUsersStreamController!.addStream(Stream.periodic(const Duration(seconds: 10), _observeOnlineUsers));
      _onlineUsersStreamSubscription ??= _onlineUsersStreamController!.stream.listen(null);
    }
  }

  Future<void> destroyObserverOnlineUsers() async {
    disposeListeners();
    await _onlineUsersStreamSubscription?.cancel();
    _onlineUsersStreamSubscription = null;
    await _onlineUsersStreamController?.close();
    _onlineUsersStreamController = null;
  }

  Future<void> _observeCurrentUser(_) async {
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        await FirebaseDatabase.instance
            .ref()
            .child('presences/${FirebaseAuth.instance.currentUser!.uid}')
            .set(EntityUserPresence(lastOnline: DateTime.now().millisecondsSinceEpoch, isOnline: true, uid: FirebaseAuth.instance.currentUser!.uid).toJson());
      } catch (_) {}
    }
  }

  Future<void> observeCurrentUser() async {
    _observeCurrentUser(null);
    if (_currentUserStreamController == null) {
      _currentUserStreamController = StreamController();
      _currentUserStreamController!.addStream(Stream.periodic(const Duration(seconds: 10), _observeCurrentUser));
      _currentUserStreamSubscription ??= _currentUserStreamController!.stream.listen(null);
    }
  }

  Future<void> destroyObserverCurrentUser() async {
    disposeListeners();
    await _currentUserStreamSubscription?.cancel();
    _currentUserStreamSubscription = null;
    await _currentUserStreamController?.close();
    _currentUserStreamController = null;
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        await FirebaseDatabase.instance
            .ref()
            .child('presences/${FirebaseAuth.instance.currentUser!.uid}/')
            .set(EntityUserPresence(lastOnline: DateTime.now().millisecondsSinceEpoch, isOnline: false, uid: FirebaseAuth.instance.currentUser!.uid).toJson());
      } catch (_) {}
    }
  }
}
