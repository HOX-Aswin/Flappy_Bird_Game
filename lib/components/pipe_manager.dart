import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/const.dart';

class PipeManager extends Component with HasGameRef {
  //pipe spawn timer
  double pipeSpawnTimer = 0;

  //update
  @override
  void update(double dt) {
    pipeSpawnTimer += dt;

    //spawn pipe
    if (pipeSpawnTimer > pipeInterval) {
      pipeSpawnTimer = 0;
      spawnPipe();
    }
  }

  //function to spawn pipe
  void spawnPipe() {
    final double screenHeight = gameRef.size.y;

    //calculate pipe heights

    //max possible height
    final double maxPipeHeight =
        screenHeight - pipeGap - minPipeHeight - groundHeight;

    //randomly set bottom pipe height between min and max
    final double bottomPipeHeight =
        minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

    //set top pipe height
    final double topPipeHeight =
        screenHeight - groundHeight - pipeGap - bottomPipeHeight;

    //create bottom pipe
    final bottomPipe = Pipe(
      //size
      Vector2(pipeWidth, bottomPipeHeight),

      //position
      Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),

      //top or bottom
      isTopPipe: false,
    );

    //create top pipe
    final topPipe = Pipe(
      //size
      Vector2(pipeWidth, topPipeHeight),

      //position
      Vector2(gameRef.size.x, 0),

      //top or bottom
      isTopPipe: true,
    );

    //add both pipe to game
    add(bottomPipe);
    add(topPipe);
  }

  //function to remove existing pipes
  void clearPipes() {
    children.whereType<Pipe>().forEach((pipe) => pipe.removeFromParent());
  }
}
