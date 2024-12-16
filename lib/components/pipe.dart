import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/const.dart';
import 'package:flappy_bird/game.dart';

class Pipe extends SpriteComponent
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  //determine if it is top pipe or bottom pipe
  final bool isTopPipe;
  bool scored = false;

  //initilize pipe
  Pipe(Vector2 size, Vector2 position, {required this.isTopPipe})
      : super(position: position, size: size);

  //load pipe
  @override
  FutureOr<void> onLoad() async {
    //pipe sprite image
    sprite = await Sprite.load(isTopPipe ? 'top_pipe.png' : 'bottom_pipe.png');

    //pipe hitbox
    add(RectangleHitbox());
  }

  //update -> every second (dt)
  @override
  void update(double dt) {
    //move pipe to left
    position.x -= groundMovingSpeed * dt;

    //update score
    if (!scored && position.x + size.x < gameRef.bird.position.x) {
      scored = true;

      //only increment for top pipe to avoid multiple increments
      if (isTopPipe) {
        gameRef.incrment();
      }
    }

    //remove pipe if it goes off screen
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
  }
}
