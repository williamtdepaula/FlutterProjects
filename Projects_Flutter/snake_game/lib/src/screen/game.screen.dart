import 'package:flutter/material.dart';
import 'package:snake_game/src/bloc/game.bloc.dart';
import 'package:snake_game/src/models/game.dart';
import 'package:snake_game/src/models/points.dart';
import 'package:snake_game/src/models/snake.dart';
import 'package:snake_game/src/widgets/buttons/button_pause.dart';
import 'package:snake_game/src/widgets/pixel/pixel_area.dart';

class GameScreen extends StatefulWidget {
  static String id = '/game';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameBloc gameBloc = new GameBloc();

  @override
  void initState() {
    super.initState();

    gameBloc.initGame(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _handlerRenderBody(),
    );
  }

  Widget _handlerRenderBody() {
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragStart: gameBloc.onHorizontalDragStart,
        onHorizontalDragUpdate: gameBloc.onHorizontalDragUpdate,
        onHorizontalDragEnd: gameBloc.onHorizontalDragEnd,
        onVerticalDragStart: gameBloc.onVerticalDragStart,
        onVerticalDragUpdate: gameBloc.onVerticalDragUpdate,
        onVerticalDragEnd: gameBloc.onVerticalDragEnd,
        child: this._handlerRenderGame(),
      ),
    );
  }

  Widget _handlerRenderGame() {
    return StreamBuilder(
      stream: gameBloc.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return Container();

        Game game = snapshot.data;

        Snake snake = game.snake;

        Points points = game.points;

        return Column(
          children: [
            Expanded(
              flex: 10,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gameBloc.pixels.totalColumns,
                ),
                itemCount: gameBloc.pixels.totalPixels,
                itemBuilder: (BuildContext context, int index) {
                  return PixelArea(
                    isSnake: snake.isBody(index),
                    isPoint: points.isPoint(index),
                    //isSuperPoint: superPoint.isPoint(index),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonPause(
                      paused: !game.gamePlaying,
                      onPressed: game.gamePlaying
                          ? gameBloc.pauseGame
                          : gameBloc.initGame,
                    ),
                    Text(
                      'Pontos: ${snake.totalPoints}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    gameBloc.clearStream();

    super.dispose();
  }
}
