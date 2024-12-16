import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_manager.dart';
import 'package:flappy_bird/components/score.dart';
import 'package:flappy_bird/const.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  /*

    Basic gme components
    
    ->bird
    ->background
    ->ground
    ->pipes
    ->score

  */

  late Bird bird;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;
  late ScoreText scoreText;

  //load everything
  @override
  FutureOr<void> onLoad() async {
    //load background
    background = Background(size);
    await add(background);

    //load bird
    bird = Bird();
    await add(bird);

    //load ground
    ground = Ground();
    await add(ground);

    //load pipes
    pipeManager = PipeManager();
    await add(pipeManager);

    //load score
    scoreText = ScoreText();
    await add(scoreText);
  }

  //tap to fly
  @override
  void onTap() {
    bird.fly();
  }

  //score
  int score = 0;

  //increment score
  void incrment() {
    score += 1;
  }

  //game over
  bool isGameOver = false;

  void gameOver() {
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine(); //stop the game engine

    //dialoge box to show the gamer you are failed and a option to restart
    showDialog(
      context: buildContext!,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("Your Score : $score"),
        actions: [
          TextButton(
            onPressed: () {
              //pop the dialoge box
              Navigator.pop(context);

              //reset game
              resetGame();
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }

  //reset game
  void resetGame() {
    //reset position
    bird.position = Vector2(birdStartX, birdStartY);

    //reset velocity
    bird.velocity = 0;

    isGameOver = false;

    //reset score
    score = 0;

    //remove existing pipes
    pipeManager.clearPipes();

    //resume engine
    resumeEngine();
  }
}
