import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  await setupFlame();
//  var game = new MazeBallGame();
//  runApp(game.widget);
}

Future setupFlame () async {
  var flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
}