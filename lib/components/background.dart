import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent {
  //initilize background size and position
  Background(Vector2 size) : super(size: size, position: Vector2(0, 0));

  //load
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('background.png');
  }
}
