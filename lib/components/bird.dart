import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/const.dart';
import 'package:flappy_bird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  //initilize bird position and size
  Bird()
      : super(
            position: Vector2(birdStartX, birdStartY),
            size: Vector2(birdWidth, birdHeight));

  //physical world properties
  double velocity = 0;

  //load
  @override
  FutureOr<void> onLoad() async {
    //add bird sprite image
    sprite = await Sprite.load('bird.png');

    //add hitbox
    add(RectangleHitbox());
  }

  //fly
  void fly() {
    velocity = jumpStrength;
  }

  //update
  @override
  void update(double dt) {
    //apply gravity
    velocity += gravity * dt;
    position.y += velocity * dt;
  }

  //collision with other object
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    //check if the bird hits the ground
    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    }

    //check if the bird hits the pipe
    if (other is Pipe) {
      (parent as FlappyBirdGame).gameOver();
    }
  }
}
