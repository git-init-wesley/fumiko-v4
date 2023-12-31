import 'package:flutter/material.dart';
import 'package:fumiko/entities/entity/classes/entity_classes.dart';
import 'package:fumiko/utils/number_formatter.dart';
import 'package:fumiko/widgets/game/indicators/bar_progress_indicator.dart';

class GameHeader extends StatelessWidget {
  const GameHeader(
      {super.key,
      required this.username,
      required this.levels,
      required this.rebirths,
      required this.exp,
      required this.maxExp,
      required this.classes,
      this.widthOffSet = 0});

  final double widthOffSet;
  final EntityClass classes;
  final String username;
  final num levels, rebirths, exp, maxExp;

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Tooltip(
          message: classes.name,
          textStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 86,
            width: 86,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            child: classes.icon.toImage(),
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            // constraints: const BoxConstraints(maxWidth: 320),
            height: 86,
            width: mediaWidth - 86 + widthOffSet,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.fontSize ??
                                0)),
                    Text('Re.$rebirths - Lv.$levels',
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.fontSize ??
                                0))
                  ],
                ),
                Tooltip(
                    message:
                        '${NumberFormatter.compact(exp)}/${NumberFormatter.compact(maxExp)}',
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.all(8),
                    child: BarProgressIndicator(
                        value: (exp / maxExp),
                        height: 24,
                        width: mediaWidth - 86 - 16 + widthOffSet,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.deepOrange,
                        child: Text(
                            'Exp: ${NumberFormatter.compact(exp)}/${NumberFormatter.compact(maxExp)}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.fontSize ??
                                    0)))),
              ],
            ))
      ],
    );
  }
}
