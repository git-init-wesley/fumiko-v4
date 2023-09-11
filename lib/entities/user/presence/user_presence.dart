part of user;

class EntityUserPresence {
  String _uid;

  String get uid => _uid;
  num _lastOnline;

  num get lastOnline => _lastOnline;

  bool _isOnline;

  bool get isOnline => _isOnline;

  EntityUserPresence({required String uid, required num lastOnline, required bool isOnline})
      : _uid = uid,
        _lastOnline = lastOnline,
        _isOnline = isOnline;

  factory EntityUserPresence.fromJson(String key, Map<dynamic, dynamic> json) =>
      EntityUserPresence(uid: key, lastOnline: num.tryParse(json['lastOnline']?.toString() ?? '0') ?? 0, isOnline: bool.tryParse(json['isOnline']?.toString() ?? 'false') ?? false);

  Map<String, dynamic> toJson() => {'lastOnline': lastOnline, 'isOnline': isOnline};
}
