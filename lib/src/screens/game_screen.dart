import 'dart:math';

import 'package:egg/src/screens/game_over_screen.dart';
import 'package:egg/src/service/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quiver/async.dart';
import 'package:vibration/vibration.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  CountdownTimer countDownTimer;

  double current = 20;
  int number = 1;
  int score = 0;
  int fail = 0;

  int highscore;
  int coin;
  int skin;
  double size = 10;

  void randomNumber() {
    setState(() => number = Random().nextInt(4));
  }

  RotatedBox getImage(int _degree, bool _upDown) {
    if (_upDown) {
      if (_degree == 0)
        _degree = 0;
      else if (_degree == 2)
        _degree = 1;
      else if (_degree == 3)
        _degree = 2;
      else if (_degree == 1) _degree = 3;
    }

    switch (skin) {
      case 0:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_blue.png' : 'assets/content/Up1_blue.png', width: size, height: size));
        break;
      case 1:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_green.png' : 'assets/content/Up1_green.png', width: size, height: size));
        break;
      case 2:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_pink.png' : 'assets/content/Up1_pink.png', width: size, height: size));
        break;
      case 3:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_red.png' : 'assets/content/Up1_red.png', width: size, height: size));
        break;
      case 4:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_yellow.png' : 'assets/content/Up1_yellow.png', width: size, height: size));
        break;
      case 5:
        return RotatedBox(
            quarterTurns: _degree, child: Image.asset(_upDown ? 'assets/content/Down1.png' : 'assets/content/Up1.png', width: size, height: size));
        break;
      case 6:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_dalga.png' : 'assets/content/Up1_dalga.png', width: size, height: size));
        break;
      case 7:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_flower.png' : 'assets/content/Up1_flower.png', width: size, height: size));
        break;
      case 8:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_garip.png' : 'assets/content/Up1_garip.png', width: size, height: size));
        break;
      case 9:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_puantiye.png' : 'assets/content/Up1_puantiye.png', width: size, height: size));
        break;
      case 10:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_zigzag_green.png' : 'assets/content/Up1_zigzag_green.png', width: size, height: size));
        break;
      case 11:
        return RotatedBox(
            quarterTurns: _degree,
            child:
                Image.asset(_upDown ? 'assets/content/Down1_zigzag_orange.png' : 'assets/content/Up1_zigzag_orange.png', width: size, height: size));
        break;

      default:
        return null;
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      size = MediaQuery.of(context).size.width * .25;
    });

    countDownTimer = new CountdownTimer(
      new Duration(seconds: 200),
      new Duration(milliseconds: 10),
    );

    countDownTimer.listen((duration) {
      setState(() => current = (20.0 - (duration.elapsed.inMilliseconds * .001)));
    }, onDone: () {
      if (score > highscore) {}
      Navigator.push(context, MaterialPageRoute(builder: (context) => GameOverScreen(score: score)));
    });

    LocalStorageService().readHighscore().then((value) => highscore = value);
    LocalStorageService().readCoin().then((value) => coin = value);
    LocalStorageService().readCurrentSkin().then((value) => skin = value);
  }

  @override
  void dispose() {
    countDownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffffc600),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Spacer(flex: 5),
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        current.toStringAsFixed(2),
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "$score",
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 10),
              Column(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: getImage(0, false),
                    ),
                    onTap: () {
                      if (number == 0) {
                        Vibration.vibrate(duration: 100);
                        setState(() => score++);
                        randomNumber();
                      } else {
                        Vibration.vibrate(pattern: [50, 100, 50, 100]);
                        fail++;
                        if (fail == 3) Navigator.push(context, MaterialPageRoute(builder: (context) => GameOverScreen(score: score)));
                        setState(() => fail);
                      }
                    },
                  ),
                  SizedBox(width: 10, height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(flex: 10),
                      InkWell(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: getImage(3, false),
                        ),
                        onTap: () {
                          if (number == 1) {
                            Vibration.vibrate(duration: 100);
                            setState(() => score++);
                            randomNumber();
                          } else {
                            Vibration.vibrate(pattern: [50, 100, 50, 100]);
                            fail++;
                            if (fail == 3) Navigator.push(context, MaterialPageRoute(builder: (context) => GameOverScreen(score: score)));
                            setState(() => fail);
                          }
                        },
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 100,
                        height: 100,
                        child: getImage(number, true),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: getImage(1, false),
                        ),
                        onTap: () {
                          if (number == 2) {
                            Vibration.vibrate(duration: 100);

                            score++;
                            setState(() => score);
                            randomNumber();
                          } else {
                            Vibration.vibrate(pattern: [50, 100, 50, 100]);
                            fail++;
                            if (fail == 3) Navigator.push(context, MaterialPageRoute(builder: (context) => GameOverScreen(score: score)));
                            setState(() => fail);
                          }
                        },
                      ),
                      Spacer(flex: 10),
                    ],
                  ),
                  SizedBox(width: 10, height: 10),
                  InkWell(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: getImage(2, false),
                    ),
                    onTap: () {
                      if (number == 3) {
                        Vibration.vibrate(duration: 100);
                        setState(() => score++);
                        randomNumber();
                      } else {
                        Vibration.vibrate(pattern: [50, 100, 50, 100]);
                        fail++;
                        if (fail == 3) Navigator.push(context, MaterialPageRoute(builder: (context) => GameOverScreen(score: score)));
                        setState(() => fail);
                      }
                    },
                  ),
                ],
              ),
              Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}
