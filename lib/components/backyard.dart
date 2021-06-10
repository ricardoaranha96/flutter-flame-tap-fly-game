import 'dart:ui';

import 'package:casualmobilegametutorial/langaw-game.dart';
import 'package:flame/components.dart';

class Backyard {
  final LangawGame game;
  late Sprite bgSprite;
  late Rect bgRect;
  bool isInitialized = false;

  Backyard(this.game) {
    //https://jap.alekhin.io/game-graphics-and-animation-tutorial-flame-flutter-part-2
    bgRect = Rect.fromLTWH(0, game.size.y - (game.tileSize * 23),
        game.tileSize * 9, game.tileSize * 23);
    initialize();
  }

  void initialize() async {
    bgSprite = await Sprite.load('bg/backyard.png');
    isInitialized = true;
  }

  void render(Canvas c) {
    if (!isInitialized) return;
    bgSprite.renderRect(c, bgRect);
  }

  void update(double dt) {}
}
