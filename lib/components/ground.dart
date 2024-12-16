import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/const.dart';
import 'package:flappy_bird/game.dart';

class Ground extends SpriteComponent
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  //initilize ground
  Ground() : super();

  //load ground
  @override
  FutureOr<void> onLoad() async {
    //set size and position for ground
    size = Vector2(2 * gameRef.size.x, groundHeight);
    position = Vector2(0, gameRef.size.y - groundHeight);

    //load ground sprite image
    sprite = await Sprite.load('ground.png');

    //add hit box
    add(RectangleHitbox());
  }

  //update -> every second
  @override
  void update(double dt) {
    //move ground to left
    position.x -= groundMovingSpeed * dt;

    //reset ground for infinite moving
    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
  }
}
