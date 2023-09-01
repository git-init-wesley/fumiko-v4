import 'package:flutter/material.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/utils/assets/assets_images.dart';
import 'package:fumiko/widgets/game/bar_progress_indicator.dart';

class GameHeader extends StatelessWidget {
  const GameHeader({super.key, required this.exp, required this.maxExp});

  final num exp;
  final num maxExp;

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 86,
          width: 86,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          child: AssetsImages.fumikoIcon.toImage(),
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            // constraints: const BoxConstraints(maxWidth: 320),
            height: 86,
            width: mediaWidth - 86,
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
                    Text(CoreUser.instance.current.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize ?? 0)),
                    Text('Re.${CoreUser.instance.current.rebirths} - Lv.${CoreUser.instance.current.levels}', style: TextStyle(fontSize: Theme.of(context).textTheme.titleMedium?.fontSize ?? 0))
                  ],
                ),
                Tooltip(
                    message: '${CoreUser.instance.current.exp.toString()}/${CoreUser.instance.current.maxExp.toString()}',
                    textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.all(8),
                    child: BarProgressIndicator(
                        value: (CoreUser.instance.current.exp / CoreUser.instance.current.maxExp),
                        height: 24,
                        width: mediaWidth - 86 - 8,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.deepOrange,
                        child: Text('Exp: ${exp}/${maxExp}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleSmall?.fontSize ?? 0)))),
              ],
            ))
      ],
    );
  }
}
