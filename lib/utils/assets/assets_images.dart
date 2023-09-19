import 'package:flutter/material.dart';

class AssetsImage {
  final String _name, _path, _extension;

  String get name => _name;

  String get path => _path;

  String get extension => _extension;

  Image toImage(
          {Key? key,
          AssetBundle? bundle,
          ImageFrameBuilder? frameBuilder,
          ImageErrorWidgetBuilder? errorBuilder,
          String? semanticLabel,
          bool excludeFromSemantics = false,
          double? scale,
          double? width,
          double? height,
          Color? color,
          Animation<double>? opacity,
          BlendMode? colorBlendMode,
          BoxFit? fit,
          AlignmentGeometry alignment = Alignment.center,
          ImageRepeat repeat = ImageRepeat.noRepeat,
          Rect? centerSlice,
          bool matchTextDirection = false,
          bool gaplessPlayback = false,
          bool isAntiAlias = false,
          String? package,
          FilterQuality filterQuality = FilterQuality.low,
          int? cacheWidth,
          int? cacheHeight}) =>
      Image.asset(path,
          key: key,
          frameBuilder: frameBuilder,
          errorBuilder: errorBuilder,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          width: width,
          height: height,
          color: color,
          opacity: opacity,
          colorBlendMode: colorBlendMode,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          isAntiAlias: isAntiAlias,
          package: package,
          filterQuality: filterQuality,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight);

  const AssetsImage(
      {required String name, required String path, required String extension})
      : _name = name,
        _path = 'assets/images/$path.$extension',
        _extension = extension;
}

class AssetsImages {
  static const AssetsImage fumikoIcon =
      AssetsImage(name: 'Fumiko Icon', path: 'icons/Fumiko', extension: 'png');
  static const AssetsImage mageIcon =
      AssetsImage(name: 'Mage Icon', path: 'icons/Mage', extension: 'png');
  static const AssetsImage ninjaIcon =
      AssetsImage(name: 'Ninja Icon', path: 'icons/Ninja', extension: 'png');
  static const AssetsImage warriorIcon = AssetsImage(
      name: 'Warrior Icon', path: 'icons/Warrior', extension: 'png');

  static const AssetsImage fumikoGraphic = AssetsImage(
      name: 'Fumiko Graphic', path: 'graphics/Fumiko', extension: 'png');
  static const AssetsImage mageGraphic = AssetsImage(
      name: 'Mage Graphic', path: 'graphics/Mage', extension: 'png');
  static const AssetsImage ninjaGraphic = AssetsImage(
      name: 'Ninja Graphic', path: 'graphics/Ninja', extension: 'png');
  static const AssetsImage warriorGraphic = AssetsImage(
      name: 'Warrior Graphic', path: 'graphics/Warrior', extension: 'png');
}
