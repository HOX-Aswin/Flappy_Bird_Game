import 'dart:async';
import 'package:flutter/material.dart';

import '../game.dart';
import 'package:flame/components.dart';

class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame> {
  //initilize score text
  ScoreText()
      : super(
          text: '0',
          textRenderer: TextPaint(
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 45,
            ),
          ),
        );

  //load
  @override
  FutureOr<void> onLoad() {
    position = Vector2(
      (gameRef.size.x / 2) - 10,
      gameRef.size.y - size.y - 70,
    );
  }

  //update
  @override
  void update(double dt) {
    //change score
    final newText = gameRef.score.toString();
    if (text != newText) {
      text = newText;
    }
  }
}
