import 'dart:ui';

import 'package:casualmobilegametutorial/langaw-game.dart';
import 'package:flame/sprite.dart';

import 'fly.dart';

class HungryFly extends Fly {
  HungryFly(LangawGame game, double x, double y) : super(game, x, y) {
    initialize();
  }

  initialize() async {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    flyingSprite.add(await Sprite.load('flies/hungry-fly-1.png'));
    flyingSprite.add(await Sprite.load('flies/hungry-fly-2.png'));
    deadSprite = await Sprite.load('flies/hungry-fly-dead.png');
    isInitialized = true;
  }
}
