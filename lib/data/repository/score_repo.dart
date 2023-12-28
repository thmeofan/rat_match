import 'package:flutter/material.dart';

class ScoreRepository {
  int score = 0;
  int life = 6;

  int addScore() {
    return score += 100;
  }

  int reduceScore() {
    return score -= 500;
  }

  int reduceLife() {
    return life -= 1;
  }
}
