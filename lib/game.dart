import 'dart:ui';
import 'package:box2d_flame/box2d.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

class MazeBallGame extends Game{
  Paint paint;
  //Size of the screen from the resize event
  Size screenSize;
  //Rectangle based on the size, easy to use
  Rect _screenRect;
  final int scale = 5;

  //Needed for Box2D
  static const int WORLD_POOL_SIZE = 100;
  static const int WORLD_POOL_CONTAINER_SIZE = 10;

  //Main physic object -> our game world
  World world;

  //Zero vector -> no gravity
  final Vector2 _gravity = Vector2.zero();

  MazeBallGame(){
    world = World.withPool(_gravity, DefaultWorldPool(WORLD_POOL_SIZE, WORLD_POOL_CONTAINER_SIZE));
    initialize();
  }

  //Initialize all things we need, devided by things need the size and things without
  Future initialize () async {
    //Call the resize as soon as flutter is ready
    resize(await Flame.util.initialDimensions());
  }

  void resize(Size size){
    paint = Paint();
    paint.color = Color(0xffffffff);
    //Store size and related rectangle
    screenSize = size;
    _screenRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    //If no size information -> leave
    if(screenSize == null){
      return;
    }
    canvas.save();
    canvas.scale(screenSize.width / scale);
    canvas.translate(_screenRect.width/2, _screenRect.height/2);
    canvas.drawCircle(Offset(0, 0), .1, paint);
    canvas.restore();
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}