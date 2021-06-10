import 'dart:ui';

import 'package:casualmobilegametutorial/langaw-game.dart';
import 'package:flame/sprite.dart';

class Fly {
  double x;
  double y;
  late double width;
  late double height;
  late Rect flyRect;
  final LangawGame game;
  bool isDead = false;
  bool isOffScreen = false;
  List<Sprite> flyingSprite = [];
  late Sprite deadSprite;
  double flyingSpriteIndex = 0;
  bool isInitialized = false;
  double get speed => game.tileSize * 3;
  late Offset targetLocation;

  Fly(this.game, this.x, this.y) {
    setTargetLocation();
  }

  render(Canvas c) {
    if (!isInitialized) return;
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  update(double dt) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 10 * dt);
      if (flyRect.top > game.size.y) {
        isOffScreen = true;
      }
    } else {
      flyingSpriteIndex += 30 * dt;
      if (flyingSpriteIndex >= flyingSprite.length) {
        flyingSpriteIndex = 0;
      }
      double stepDistance = speed * dt;
      Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }
    }
  }

  void onTapDown() {
    isDead = true;
  }

  setTargetLocation() {
    double x = game.rnd.nextDouble() * (game.size.x - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() * (game.size.y - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }
}
