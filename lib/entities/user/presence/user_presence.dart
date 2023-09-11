part of user;

class UserPresences {
  String _uid;

  String get uid => _uid;
  num _lastOnline;

  num get lastOnline => _lastOnline;

  bool _isOnline;

  bool get isOnline => _isOnline;

  UserPresences({required String uid, required num lastOnline, required bool isOnline})
      : _uid = uid,
        _lastOnline = lastOnline,
        _isOnline = isOnline;

  factory UserPresences.fromJson(String key, Map<dynamic, dynamic> json) =>
      UserPresences(uid: key, lastOnline: num.tryParse(json['lastOnline']?.toString() ?? '0') ?? 0, isOnline: bool.tryParse(json['isOnline']?.toString() ?? 'false') ?? false);

  Map<String, dynamic> toJson() => {'lastOnline': lastOnline, 'isOnline': isOnline};
}
