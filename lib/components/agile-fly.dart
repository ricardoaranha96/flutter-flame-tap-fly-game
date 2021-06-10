import 'dart:ui';

import 'package:casualmobilegametutorial/langaw-game.dart';
import 'package:flame/sprite.dart';

import 'fly.dart';

class AgileFly extends Fly {
  double get speed => game.tileSize * 5;

  AgileFly(LangawGame game, double x, double y) : super(game, x, y) {
    initialize();
  }

  initialize() async {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);

    flyingSprite.add(await Sprite.load('flies/agile-fly-1.png'));
    flyingSprite.add(await Sprite.load('flies/agile-fly-2.png'));
    deadSprite = await Sprite.load('flies/agile-fly-dead.png');
    isInitialized = true;
  }
}
