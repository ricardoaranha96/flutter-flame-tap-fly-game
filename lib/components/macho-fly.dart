import 'dart:ui';

import 'package:casualmobilegametutorial/langaw-game.dart';
import 'package:flame/sprite.dart';

import 'fly.dart';

class MachoFly extends Fly {
  double get speed => game.tileSize * 2.5;

  MachoFly(LangawGame game, double x, double y) : super(game, x, y) {
    initialize();
  }

  initialize() async {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flyingSprite.add(await Sprite.load('flies/macho-fly-1.png'));
    flyingSprite.add(await Sprite.load('flies/macho-fly-2.png'));
    deadSprite = await Sprite.load('flies/macho-fly-dead.png');
    isInitialized = true;
  }
}
