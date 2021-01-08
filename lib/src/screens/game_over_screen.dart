import 'package:egg/src/screens/game_screen.dart';
import 'package:egg/src/screens/home_screen.dart';
import 'package:egg/src/service/local_storage.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatefulWidget {
  final int score;

  GameOverScreen({
    @required this.score,
    Key key,
  }) : super(key: key);

  @override
  _GameOverScreenState createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  int highscore;

  @override
  void initState() {
    super.initState();

    LocalStorageService().readHighscore().then((value) => highscore = value);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xffffc600),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'High Score $highscore',
                      style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'You scored ${widget.score}',
                      style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .35,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Main Menu',
                            style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/home-screen', (Route<dynamic> route) => route is HomeScreen),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .35,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'PLAY AGAIN',
                            style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/game-screen', (Route<dynamic> route) => route is GameScreen),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
