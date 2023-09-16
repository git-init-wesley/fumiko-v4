import 'package:flutter/material.dart';
import 'package:fumiko/entities/monster/monster.dart';
import 'package:fumiko/entities/user/user.dart';

class WinRate {
  num? _rate;

  num get rate => _rate ?? 0;
  bool? _isBoss;

  bool get isBoss => _isBoss ?? false;

  WinRate.ofPvE({required EntityMonster monster, required EntityUser user}) {
    _isBoss = monster.isBoss;
    _rate = user.power / monster.power * 100;
  }

  Color color() {
    if (rate >= 75) {
      return Colors.greenAccent;
    }
    if (rate >= 50) {
      return Colors.yellowAccent;
    }
    if (rate >= 25) {
      return Colors.amber;
    }
    if (isBoss) {
      return Colors.black;
    } else {
      return Colors.redAccent;
    }
  }
}
