import 'package:casualmobilegametutorial/langaw-game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

void main() {
  final game = LangawGame();
  runApp(GameWidget(game: game));
}
