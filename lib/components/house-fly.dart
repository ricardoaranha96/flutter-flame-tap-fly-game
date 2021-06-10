import 'dart:ui';

import 'package:casualmobilegametutorial/components/fly.dart';
import 'package:casualmobilegametutorial/langaw-game.dart';

class HouseFly extends Fly {
  HouseFly(LangawGame game, double x, double y) : super(game, x, y) {
    initialize();
  }

  initialize() async {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);

    flyingSprite.add(await game.loadSprite('flies/house-fly-1.png'));
    flyingSprite.add(await game.loadSprite('flies/house-fly-2.png'));
    deadSprite = await game.loadSprite('flies/house-fly-dead.png');
    isInitialized = true;
  }
}
