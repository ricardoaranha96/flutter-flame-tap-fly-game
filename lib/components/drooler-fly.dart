import 'dart:ui';

import 'package:casualmobilegametutorial/langaw-game.dart';
import 'package:flame/sprite.dart';

import 'fly.dart';

class DroolerFly extends Fly {
  double get speed => game.tileSize * 1.5;

  DroolerFly(LangawGame game, double x, double y) : super(game, x, y) {
    initialize();
  }

  initialize() async {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);

    flyingSprite.add(await Sprite.load('flies/drooler-fly-1.png'));
    flyingSprite.add(await Sprite.load('flies/drooler-fly-2.png'));
    deadSprite = await Sprite.load('flies/drooler-fly-dead.png');
    isInitialized = true;
  }
}
