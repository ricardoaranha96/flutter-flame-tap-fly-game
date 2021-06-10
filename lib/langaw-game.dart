import 'dart:math';

import 'package:casualmobilegametutorial/components/fly.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';

import 'components/backyard.dart';
import 'components/house-fly.dart';
import 'components/drooler-fly.dart';
import 'components/agile-fly.dart';
import 'components/macho-fly.dart';
import 'components/hungry-fly.dart';

class LangawGame extends Game with TapDetector {
  late Size screenSize;
  late double tileSize;
  late List<Fly> flies;
  late Random rnd;
  late Backyard background;

  Future<void> onLoad() async {
    resize(new Size(size.x, size.y));
    background = Backyard(this);
    flies = [];
    rnd = Random();
    spawnFly();
  }

  render(Canvas canvas) {
    background.render(canvas);
    flies.forEach((Fly fly) => fly.render(canvas));
  }

  update(double dt) {
    flies.forEach((Fly fly) => fly.update(dt));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));

    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(MachoFly(this, x, y));
        break;
      case 2:
        flies.add(HungryFly(this, x, y));
        break;
      case 3:
        flies.add(AgileFly(this, x, y));
        break;
      case 4:
        flies.add(DroolerFly(this, x, y));
        break;
    }
  }

  onTapDown(TapDownInfo event) {
    //https://stackoverflow.com/a/60121649/7015083
    //https://stackoverflow.com/a/64868086/7015083
    //https://stackoverflow.com/a/52407983/7015083
    bool isFlyTapped = false;
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(event.eventPosition.game.toOffset()) &&
          !fly.isDead) {
        fly.onTapDown();
        isFlyTapped = true;
      }
    });
    if (isFlyTapped) {
      spawnFly();
    }
  }
}
